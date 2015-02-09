ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "jonathan.rojas@globalr.net",
  :password             => "remolacho",
  :authentication       => "plain",
  :enable_starttls_auto => true
}