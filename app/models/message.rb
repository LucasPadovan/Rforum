class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :mensajepersonal

  attr_accessible :body, :mensajepersonal_id, :user_id

  validates :body, :presence => true
end