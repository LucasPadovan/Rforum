module CommentsHelper
  def ultimos_comentarios
    Comment.find_by_sql("SELECT co.body, co.id, u.username, co.user_id, c.title, co.conversation_id, co.created_at
    FROM users u, conversations c,
    (WITH conversations AS (
          SELECT c.id,
    	   c.user_id,
               c.body,
               c.conversation_id,
               c.created_at,
               ROW_NUMBER() OVER(PARTITION BY c.conversation_id
                                     ORDER BY c.created_at DESC) AS rk
          FROM comments c)
      SELECT s.*  FROM conversations s WHERE s.rk = 1) AS co
    WHERE co.conversation_id = c.id AND co.user_id = u.id
    ORDER BY co.created_at DESC LIMIT 10; ")
  end
end

