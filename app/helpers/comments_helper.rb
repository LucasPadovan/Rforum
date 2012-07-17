module CommentsHelper
  def ultimos_comentarios
    comments = []
    Conversation.order('updated_at DESC').first(10).map { |conversation| comments << conversation.comments.last }
    comments
  end
end

