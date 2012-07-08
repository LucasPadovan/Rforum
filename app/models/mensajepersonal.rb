class Mensajepersonal < ActiveRecord::Base
  belongs_to :remitente, :class_name => 'User'
  belongs_to :destinatario, :class_name => 'User'
  belongs_to :hilo, :class_name => 'Mensajepersonal'

  has_many :respuestas, :class_name => 'Mensajepersonal'

  default_scope :order => 'created_at'

end
