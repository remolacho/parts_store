ActionMailer::Base.smtp_settings = {
  :address              => "smtp.gmail.com",
  :port                 => 587,
  :domain               => "gmail.com",
  :user_name            => "partstore.armando@gmail.com",
  :password             => "armando17811780",
  :authentication       => "plain",
  :enable_starttls_auto => true
}