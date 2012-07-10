class Notifier < ActionMailer::Base
  default from: "'Rforum' <#{APP_CONFIG['smtp']['user_name']}>"

  def new_comment(comment)
    @comment = comment

    mail(
      bcc: User.notificable.map(&:email), # Implementar suscripciones
      subject: "CursosCetem: comentaron en [#{comment.conversation.title}]"
    )
  end
end
