class UserMailer < ActionMailer::Base
  default from: "teo@dellamico.com"

  def welcome_email(user)
  	@user = user
  	@url = 'http://fast-badlands-5777.herokuapp.com/'
  	mail(to: user.email, subject: "Welcome to Band Manager")
  end

  def activation_email(user)
  	@user = user
  	@url = 'http://fast-badlands-5777.herokuapp.com/'
  	mail(to: user.email, subject: "Activation Email")
  end
  
end
