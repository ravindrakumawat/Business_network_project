class LoginsController < ApplicationController

def index
   @users = User.all
   @logins = Login.all
end

def new
  @login = Login.new
end

def create

  @login = Login.new(params[:groupchat])
  @login.name = session[:user_id]
     if @login.save
     flash[:notice] = 'OK'
     redirect_to :controller=>'group_chat', :action => 'index'
     else
    render :action => 'new'
     end

end


end
