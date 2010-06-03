class VideosController < ApplicationController
  
 before_filter :login_required
 layout 'home'
  def index
  @videos = Video.paginate :page => params[:page],:conditions => "user_id = '#{current_user.id}'",
 :per_page => 5
  end
  def new
    redirect_to '/' unless current_user
    @video = Video.new
  end
  def create
    @photo = current_user.photo ||= Photo.new
    @video = Video.new(params[:video])
    @video.user = @current_user
    if @video.save
      @video.convert
      flash[:notice] = 'Video has been uploaded'
      redirect_to :action => 'index'
    else
      render :action => 'new'
    end
  end

  def show
    @video = Video.find(params[:id])
    @reply = VideoReply.new
  end
  
  def delete
    @video = Video.find(params[:id])
    @video.destroy
    redirect_to :action => 'index'
  end
end
