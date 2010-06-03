class OnlinesController < ApplicationController

def index
   @users = User.all
   @onlines = Online.all
end

def new
  @online = Online.new
end

def create
  
  @online = Online.new(params[:groupchat])
  @online.name = session[:user_id]
     if @online.save
     flash[:notice] = 'OK'
     redirect_to :controller=>'group_chats', :action => 'index'
     else
    render :action => 'new'
     end

end


end
