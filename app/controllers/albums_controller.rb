class AlbumsController < ApplicationController
  before_filter :login_required
  layout 'home'
    def index
   redirect_to(:action => 'signup') unless logged_in? || User.count > 0
    @photo = current_user.photo ||= Photo.new
    @albums = Album.paginate(:page => params[:page],:conditions => "user_id = '#{current_user.id}'",
    :per_page => 10)
  end
   def show
    @photo = current_user.photo ||= Photo.new
    @album = Album.find(params[:id])
  end
  def new
  @photo = current_user.photo ||= Photo.new
  @album = Album.new
  1.upto(3) { @album.pictures.build }
  end
  def edit
    @photo = current_user.photo ||= Photo.new
    @album = Album.find(params[:id])
  if @album.pictures.first.nil?
    1.upto(1) { @album.pictures.build }
  end
  end
  def create
    @album = Album.new(params[:album])
    @album.user = current_user
      if @album.save
        flash[:notice] = 'Album was successfully created.'
        redirect_to (@album) 
      else
        render :action => 'new'
      end
  end
 def update
   params[:picture_ids] ||= []
  @album = Album.find(params[:id])
  unless params[:picture_ids].empty?
    Picture.destroy_pics(params[:id], params[:picture_ids])
  end
      if @album.update_attributes(params[:album])
        flash[:notice] = 'Album was successfully updated.'
        redirect_to(@album) 
       else
       render :action => "edit"
      end
  end
 def destroy
     @album = Album.find(params[:id])
    @album.destroy
      redirect_to(albums_url)  
  end

 def my_picture

  @album = Album.find(params[:id])
  @picture = Picture.find(params[:pro])
  @pictures = @album.pictures.all
  end
end