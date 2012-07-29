class Mensajepersonal < ActiveRecord::Base
  belongs_to :remitente, :class_name => 'User'
  belongs_to :destinatario, :class_name => 'User'

  has_many :messages, :dependent => :destroy

  default_scope :order => 'created_at'

end