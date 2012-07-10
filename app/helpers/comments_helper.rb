module CommentsHelper
  def ultimos_comentarios
    Comment.find_by_sql("SELECT DISTINCT ON (c.id)
           u.username, co.user_id, c.title, co.conversation_id, co.body, co.id, co.created_at
           FROM conversations c, comments co, users u
           WHERE c.id = co.conversation_id AND u.id = co.user_id
           ORDER BY c.id DESC, co.created_at DESC
           LIMIT 10;")
  end
end

