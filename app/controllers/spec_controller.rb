class SpecController < ApplicationController
  layout 'application'
def index
       @user = self.current_user
       @spec = @user.spec ||= Spec.new
       @education = @user.education ||= Education.new
       @company = @user.company ||= Company.new
       @photo = @user.photo ||= Photo.new
   end

def edit
@title = "Edit Your details"
@user = self.current_user
@user.spec ||= Spec.new
@spec = @user.spec
if param_posted?(:spec)
if @user.spec.update_attributes(params[:spec])
flash[:notice] = "Changes saved."
redirect_to :controller => "spec", :action => "index"
end
end
end
end
