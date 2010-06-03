class ShareVideosController < ApplicationController
 layout 'home'
  def index
    @share_videos = ShareVideo.all
    end
 def show
    @share_video = ShareVideo.find(params[:id])
  end
 
 def new
    @share_video = ShareVideo.new
  end
 def edit
    @share_video = ShareVideo.find(params[:id])
  end
 def create
    @share_video = ShareVideo.new(params[:share_video])
    if @share_video.save
        flash[:notice] = 'ShareVideo was successfully created.'
         redirect_to(@share_video)
      else
       render :action => "new"
     end
   end
  def update
    @share_video = ShareVideo.find(params[:id])
   if @share_video.update_attributes(params[:share_video])
        flash[:notice] = 'ShareVideo was successfully updated.'
       redirect_to(@share_video)
       else
         render :action => "edit"
       end
  end

 def destroy
    @share_video = ShareVideo.find(params[:id])
    @share_video.destroy
    redirect_to(share_videos_url)
    end
 end
