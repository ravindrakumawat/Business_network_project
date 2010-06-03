class ProfileController < ApplicationController
layout 'spec'
  helper :photo
  def index
   
  end

  def show
   
    @friend = params[:id]
    @friendship =  Friendship.find(:first,:conditions => ['friend_id = ? and user_id = ?', @friend, current_user.id])
    @hide_edit_links = true
     login = params[:login]
     @user = User.find_by_login(login)
     if @user
       @title = "My linkedout Profile for #{login}"
       @spec = @user.spec ||= Spec.new
       @education = @user.education ||= Education.new
       @photo = @user.photo ||= Photo .new
       make_profile_vars
     else
      flash[:notice] = "No user #{login} at LinkedOUT!"
      redirect_to :action => "index"
    end
  end
end
