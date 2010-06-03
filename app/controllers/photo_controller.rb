class PhotoController < ApplicationController

  before_filter :login_required
  def index
    redirect_to :controller => "home", :action => "index"
  end

 def upload
     @title = "Upload Your Photo"
     @user = self.current_user
     @user.photo ||= Photo.new
     @photo = @user.photo
       if param_posted?(:photo)
       if @photo.update_attributes(params[:photo])
         if params[:photo][:photo].blank?
        flash[:notice] = 'Avatar was successfully updated.'
        redirect_to :controller => "home", :action => "index"
        else
        render :action => "crop"
       end
       else
         render :action => "upload"
       end
       end
  end

  def delete
   user = self.current_user
   user.photo.delete
   flash[:notice] = "Your avatar has been deleted."
   redirect_to :controller=>'home', :action=>'index'
end

   
end