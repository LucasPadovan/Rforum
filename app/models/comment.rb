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

  def self.ultimo(idconversation)
    Comment.where('conversation_id = ?', idconversation)
  end

  def self.positivo(comment,user)
    unless user.voted_for? comment
       comment.vote :voter => user
    end
  end

  def self.negativo(comment,user)
    unless user.voted_for? comment
      comment.downvote_from user
    end
  end

end
