# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  include AuthenticatedSystem
 # include SslRequirement
  before_filter :login_from_cookie
  helper :all # include all helpers, all the time
  protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
  # filter_parameter_logging :password
  def param_posted?(sym)
    request.post? and params[sym]
  end
 def make_profile_vars
   
    @spec = @user.spec ||= Spec.new
    @blog = @user.blog ||= Blog.new
    @posts = @blog.posts
 end
end
