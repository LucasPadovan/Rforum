module CommentsHelper

  def ultimos_comentarios
    comentarios_unicos = []
    Comment.all.reverse_each do |comment|
      unless comentarios_unicos.find{|c| c.conversation_id == comment.conversation_id}
        comentarios_unicos << comment
      end
      break if comentarios_unicos.size > 10
    end
    comentarios_unicos
  end
  #
  #def ucmoent
  #  Comment.find_by_sql("SELECT * FROM comments co JOIN user u JOIN conversation c
  #  ON co.conversation_id = c.conversation_id AND co.user_id = u.user_id")
  #end
end

