class CompanyController < ApplicationController
 before_filter :login_required
  def index
    redirect_to :controller => "user", :action => "index"
  end

def edit
@title = "Company Info"
@user = self.current_user
@user.company ||= Company.new
@company = @user.company
if param_posted?(:company)
if @user.company.update_attributes(params[:company])
flash[:notice] = "Changes saved."
redirect_to :controller => "spec", :action => "index"
end
end
end
end
