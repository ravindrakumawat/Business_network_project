class SoundsController < ApplicationController
 
  before_filter :login_required
  layout 'home'
  def index
   @photo = current_user.photo ||= Photo.new
   @sounds = Sound.paginate :page => params[:page],:conditions => "user_id = '#{current_user.id}'",
    :per_page => 5
  end
  def show
     @photo = current_user.photo ||= Photo.new
    @sound = Sound.find(params[:id])

  end
  def new
     @photo = current_user.photo ||= Photo.new
    @sound = Sound.new
  end
  def edit
     @photo = current_user.photo ||= Photo.new
    @sound = Sound.find(params[:id])
  end
  def create
     @photo = current_user.photo ||= Photo.new
     @sound = Sound.new(params[:sound])
     @sound.user = @current_user
        if @sound.save
        flash[:notice] = 'File was successfully uploaded.'
       redirect_to :action=> 'index'
    else
       render :action=> 'new'
    end
  end
  def update
     @photo = current_user.photo ||= Photo.new
    @sound = Sound.find(params[:id])

    if @sound.update_attributes(params[:sound])
        flash[:notice] = 'File was successfully updated.'
       redirect_to :action=> 'show'
      else
       render_to :action=> 'edit'
    end
   end
  def destroy
    @sound = Sound.find(params[:id])
    @sound.destroy
    redirect_to :action=> 'index'
  end
end