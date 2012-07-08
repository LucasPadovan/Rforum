class Conversation < ActiveRecord::Base
  has_many :comments, :dependent => :destroy
  belongs_to :user
  belongs_to :board
  validates :title, :presence => true
  validates_length_of :title, :maximum => 50

  default_scope :order => 'id'

end
