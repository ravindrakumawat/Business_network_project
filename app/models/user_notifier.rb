class UserNotifier < ActionMailer::Base
  def signup_notification(user)
    setup_email(user)
    @subject    += 'Please activate your new account'
    @body[:url]  = "http://192.168.1.131:3000/account/activate/#{user.activation_code}"
  end
  
  def activation(user)
    setup_email(user)
    @subject    += 'welcome to Get2Gether!'
    @body[:url]  = "http://192.168.1.131:3000/"
  end
  def reset_notification(user)
   setup_email(user)
   @subject    += 'Link to reset your password'
   @body[:url]  = "http://192.168.1.131:3000/reset/#{user.reset_code}"
  end
   protected
  def setup_email(user)
    @recipients  = "#{user.email}"
    @from        = "Get2gether"
    @subject     = "[Get2gether] "
    @sent_on     = Time.now
    @body[:user] = user
  end
end
