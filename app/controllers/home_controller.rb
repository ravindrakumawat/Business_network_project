class HomeController < ApplicationController
  before_filter :login_required
  helper :photo
  layout 'user'
  def index
       redirect_to(:action => 'signup') unless logged_in? || User.count > 0
       @user = self.current_user
       @spec = @user.spec ||= Spec.new
       @education = @user.education ||= Education.new
       @company = @user.company ||= Company.new
       @photo = @user.photo ||= Photo.new
        make_profile_vars
   @albums = Album.find(:all,:conditions => "user_id = '#{current_user.id}'" )

   @search = User.search(params[:search])    
  end

  def search
   @search = User.search(params[:search])
   @users = @search.paginate(:all,:order => "login ASC",:page => params[:page],:per_page => 6)
    render :partial => 'search', :layout=> 'home'
   end

 def new
  @status = UserStatus.new
  end
def create
    @status = UserStatus.new(params[:status])
    @status.user = current_user
 if @status.save
    redirect_to :controller=> 'home',:action=>'index'
  else
   render :new
  end

end
def edit
    @status = UserStatus.find(params[:id])
end
 def update
    @status = UserStatus.find(params[:id])
    if @status.update_attributes(params[:status])
        redirect_to :controller=> 'home',:action=> 'index'
    else
       render :edit
    end
 end
end
