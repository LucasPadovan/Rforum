class Conversation < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  belongs_to :user
  belongs_to :board

  validates :title, :presence => true
  validates_length_of :title, :maximum => 50

  def ultima_pagina
    numerocomentarios = self.comments.count
    retorno = ""
    Integer n = 0
    if numerocomentarios > 15
      unless numerocomentarios%15 == 0
        n = 1
      end

      n += numerocomentarios/15
      n = String(n)
      retorno = "?page="+n
    else
      retorno
    end
  end

end
