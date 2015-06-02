class Mailer < ActionMailer::Base
  default from: "textattendance@gmail.com"

  def validation_email(user)
    @link = 'http://www.textattendance.com'+validate_email_path+'?q='+user.email_check
    mail(to: user.email, subject: 'Text Attendance: please validate your email.')
  end
end
