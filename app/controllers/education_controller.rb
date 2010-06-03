class EducationController < ApplicationController
   
  before_filter :login_required
  def index
    redirect_to :controller => "account", :action => "index"
  end 

 def edit
  @title = "Edit Your details"
@user = self.current_user
@user.education ||= Education.new
@education = @user.education
if param_posted?(:education)
if @user.education.update_attributes(params[:education])
flash[:notice] = "Changes saved."
redirect_to :controller => "spec", :action => "index"
end
end
end
end


