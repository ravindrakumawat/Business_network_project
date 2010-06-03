class FriendshipController < ApplicationController
  include ProfileHelper
  before_filter :login_required, :setup_friends
  
  # Send a friend request.
  # We'd rather call this "request", but that's not allowed by Rails.
  def index
  @title = "My Connections"
  end

  def create
    Friendship.request(@user, @friend)
    flash[:notice] = "Friend request sent."
    redirect_to profile_for(@friend)
  end

  def accept
    if @user.requested_friends.include?(@friend)
      Friendship.accept(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.login} accepted!"
    else
      flash[:notice] = "No friendship request from #{@friend.login}."
    end
    redirect_to :controller=> 'profile', :action=> 'show'
  end
  
  def decline
    if @user.requested_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.login} declined"
    else
      flash[:notice] = "No friendship request from #{@friend.login}."
    end
    
  end
  
  def cancel
    if @user.pending_friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship request canceled."
    else
      flash[:notice] = "No request for friendship with #{@friend.login}"
    end
   
  end
  
  def delete
    if @user.friends.include?(@friend)
      Friendship.breakup(@user, @friend)
      flash[:notice] = "Friendship with #{@friend.login} deleted!"
    else
      flash[:notice] = "You aren't friends with #{@friend.login}"
    end
  
  end

  private   
  def setup_friends
    @user = User.find(session[:user_id])
    @friend = User.find_by_login(params[:id])
  end
end