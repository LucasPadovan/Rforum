class Board < ActiveRecord::Base
  default_scope :order => 'id'

  has_many :conversations
  #has_many :childs, class_name: "Board", foreign_key: 'father_id'
  #belongs_to :father, class_name: "Board", foreign_key: 'father_id'

  validates :title, :uniqueness=>true
  validates :title,:descripcion, :presence => true

  validates_length_of :title, :maximum => 50

  scope :foros, lambda{ |padre| where('padre = ?' , padre)}

  def self.padres
    foro = Board.foros(0)
    forosprincipales = foro + Board.principales
  end

  def self.principales
    principales = Board.foros(1)
  end
end
