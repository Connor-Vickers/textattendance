class Mailer < ActionMailer::Base
  default from: "textattendance@gmail.com"

  def validation_email(user)
    @link = 'http://www.textattendance.com'+validate_email_path+'?q='+user.auth_token
    mail(to: user.email, subject: 'Text Attendance: please validate your email.')
  end
  def lock_email(user)
    @link = 'http://www.textattendance.com'+unlock_path+'?q='+user.auth_token
    mail(to: user.email, subject: 'Text Attendance: your account has been locked.')
  end
end
