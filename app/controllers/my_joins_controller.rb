class MyJoinsController < ApplicationController
before_filter :login_required
 def index
 @search = GroupJoin.search(params[:search])
 @group_joins = @search.paginate(:all,:order => "id DESC",:conditions=>{:user_id=> current_user.id},:page => params[:page],:per_page => 6)

 end
end
  

