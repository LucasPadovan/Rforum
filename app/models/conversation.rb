class Conversation < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  belongs_to :user
  belongs_to :board

  validates :title, :presence => true
  validates_length_of :title, :maximum => 50

  def ultima_pagina
    numerocomentarios = self.comments.length
    retorno = ""
    Integer n = 0
    if numerocomentarios > 15
      n = numerocomentarios%15
      n += numerocomentarios/15
      retorno = "?page="+n.to_s
    else
      retorno
    end
  end

end
