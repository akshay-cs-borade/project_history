class NotificationMailer < ApplicationMailer
  default from: "notifications@yourapp.com"

  def notify_users(project, message)
    @message = message
    @project = project
    recipients = User.where(role: [:developer, :manager, :admin]).pluck(:email)
    
    mail(to: recipients, subject: "Project Update - #{@project.name}")
  end
end
