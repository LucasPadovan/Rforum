module ConversationsHelper

def ultima_pagina(conversacion)
  numerocomentarios = conversacion.comments.count
  retorno=""
  Integer n = 0
  if numerocomentarios > 15
    unless numerocomentarios%15 == 0
      n = 1
    end

    n += numerocomentarios/15
    n = String(n)
    retorno="?page="+n
  else
    retorno
  end
end

end
