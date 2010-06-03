class GroupChatsController < ApplicationController
 
  layout 'application'

  def index
     @group_chats = GroupChat.all(:order => "id DESC")
     @users = User.all
     @onlines = Online.all
    new
  end

  def show
    @group_chat = GroupChat.find(params[:id])
  end

  def new
    @group_chat = GroupChat.new
  end

  def edit
    @group_chat = GroupChat.find(params[:id])
  end

  def create
     @group_chats = GroupChat.all(:order => "id DESC")
     @users = User.all
     @onlines = Online.all
     @group_chat = GroupChat.new(params[:group_chat])
     if @group_chat.save
     redirect_to  :action=> 'index'
    end
  end

  def update
    @group_chat = GroupChat.find(params[:id])

    if @group_chat.update_attributes(params[:group_chat])
        redirect_to(@group_chat) 
      else
        render :action => "edit"
    end
  end
  def destroy
    @group_chat = GroupChat.find(params[:id])
    @group_chat.destroy

     redirect_to(group_chats_url)
  end
end
