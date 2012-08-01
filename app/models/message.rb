class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :mensajepersonal

  attr_accessible :body, :mensajepersonal_id, :user_id

  validates :user_id, :mensajepersonal_id, :body, presence: true
end