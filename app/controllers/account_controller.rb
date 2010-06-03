class AccountController < ApplicationController
  # Be sure to include AuthenticationSystem in Application Controller instead
 include AuthenticatedSystem
 include ApplicationHelper
 before_filter :login_from_cookie
 #ssl_required :login
layout 'login'
def login
   return unless request.post?
    self.current_user = User.authenticate(params[:login], params[:password])
    if logged_in?
        session[:user_id] = current_user.id
        session[:user_name] = current_user.login
      if params[:remember_me] == "1"
        self.current_user.remember_me
        cookies[:auth_token] = { :value => self.current_user.remember_token , :expires => self.current_user.remember_token_expires_at }
      end
     redirect_back_or_default(:controller => 'home', :action => 'index')
     flash[:notice] = "Logged in successfully"
    online
    else
     flash[:notice] = "Incorrect User name or password."
  end
end
 def signup
    @user = User.new(params[:user])
    return unless request.post?
    @user.save!
    self.current_user = @user
    redirect_back_or_default(:controller=>'account', :action => 'welcome')
    rescue ActiveRecord::RecordInvalid
    flash[:error]= "Could not sign up."
    render :action => 'signup'

  end
  
  def logout
    clear_online
     self.current_user.forget_me if logged_in?
    cookies.delete :auth_token
    reset_session
    flash[:notice] = "You have been logged out."
    redirect_back_or_default(:controller => '/account', :action => 'signup')
  end
  def activate     
    @user = User.find_by_activation_code(params[:id])
    if @user and @user.activate
      self.current_user=@user
      flash[:notice]="Your account has been activated."     
    end
    redirect_back_or_default(:controller=>'/account',:action=>'login')
  end

  def forgot
    if request.post?
      user = User.find_by_email(params[:user][:email])
      if user
        user.create_reset_code
        flash[:notice] = "Reset code sent to #{user.email}"
      else
        flash[:notice] = "#{params[:user][:email]} does not exist in system"
      end
      redirect_back_or_default('/')
    end
  end

  def reset
    @user = User.find_by_reset_code(params[:reset_code]) unless params[:reset_code].nil?
    if request.post?
      if @user.update_attributes(:password => params[:user][:password], :password_confirmation => params[:user][:password_confirmation])
        self.current_user = @user
        @user.delete_reset_code
        flash[:notice] = "Password reset successfully for #{@user.email}"
         redirect_back_or_default(:controller=>'/account',:action=>'login')
      else
        render :action => :reset
      end
    end
  end

 def online
  @online = Online.new(params[:id])
  @online.name = session[:user_id]
  @online.save   
 end

def clear_online
     @onlines = Online.all
     for online in @onlines
       if online.name==session[:user_id]
      online.destroy
       end
     end
  end
end
