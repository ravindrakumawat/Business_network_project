class ChatsController < ApplicationController
 def index
  @chats = GroupChat.all(:order => "id DESC",:conditions=> {:session_id => current_session})
  @users = User.all
  @onlines = Online.all
  new
end
 def new
   @group_chats = GroupChat.all
   @chat = GroupChat.new
 end

 def create   
   @chat = GroupChat.new(params[:groupchat])
   if @chat.save
    redirect_to :action=> 'index'
   else
     flash[:notice]= 'Message not sent.'
   end
 end
end
