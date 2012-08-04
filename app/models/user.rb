class User < ActiveRecord::Base
  acts_as_authentic

  acts_as_voter

  scope :notificable, where(notify_by_email: true)

  has_many :comments, :dependent=>:destroy

  has_many :msjenviados, :class_name => 'Mensajepersonal', :foreign_key => 'remitente_id'
  has_many :msjrecibidos, :class_name => 'Mensajepersonal', :foreign_key => 'destinatario_id'

  def to_s
    [self.nombre, self.apellido].compact.join(' ')
  end

  def recibidosnuevos
    msjrecibidos.where('estado =? OR estado =?', 1, 3).count
  end

  def enviadosnuevos
    msjenviados.where('estado =?', 4).count
  end
end
