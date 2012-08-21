class Comment < ActiveRecord::Base
  acts_as_votable

  after_create :send_by_email

  belongs_to :conversation
  belongs_to :user
  validates :body, :presence => true

  default_scope :order => 'id'

  def send_by_email
    Notifier.new_comment(self).deliver
  end

  class << self

    def ultimos_comentarios
      Conversation.order('updated_at DESC').includes(:comments, :board).first(10)
    end

    def ultimo(idconversation)
      Comment.where('conversation_id = ?', idconversation)
    end

    def positivo(comment,user)
      unless user.voted_for? comment
         comment.vote :voter => user
      end
    end

    def negativo(comment,user)
      unless user.voted_for? comment
        comment.downvote_from user
      end
    end

  end

end
