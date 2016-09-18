# Preview all emails at http://localhost:3000/rails/mailers/notifications
class NotificationsPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/notifications/new_comment
  def new_comment
    Notifications.new_comment
  end

  # Preview this email at http://localhost:3000/rails/mailers/notifications/invitation
  def invitation
    Notifications.invitation
  end

end
