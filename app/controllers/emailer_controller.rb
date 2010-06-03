class EmailerController < ApplicationController
layout 'home'

  def index
   @photo = current_user.photo ||= Photo.new  
  end
  def sendmail
  
  email = params["email"]
  recipient = email["recipient"]
 
  user=email["user"]
  message = email["message"]
  Emailer.deliver_contact(recipient,user,message)
  return if request.xhr?
    flash[:notice] ='Message sent successfully.'
    redirect_to :action=> 'index'
  end

def friend_request(mail)
subject 'New friend request at LinkedOUT.com'
from 'LinkedOUT <do-not-reply@LinkedOUT.com>'
recipients mail[:friend].email
body mail
end

end
