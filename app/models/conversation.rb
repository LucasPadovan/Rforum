class Conversation < ActiveRecord::Base
  has_many :comments, :dependent => :destroy

  belongs_to :user
  belongs_to :board

  validates :title, :presence => true
  validates_length_of :title, :maximum => 50

  def ultima_pagina
    numerocomentarios = self.comments.length
    retorno = ""
    if numerocomentarios > 15
      n = 1 + numerocomentarios/15
      retorno = "?page=#{n}"
    else
      retorno
    end
  end

end
