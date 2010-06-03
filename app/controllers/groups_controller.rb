class GroupsController < ApplicationController
  layout 'application'
  before_filter :login_required
  def index
    @search = Group.search(params[:search])
    @groups = @search.paginate(:all,:order => "id DESC",:page => params[:page],:per_page => 6)
  end
 
  def show
    @group = Group.find(params[:id])
    @group_join = GroupJoin.find(:first,:conditions => ['group_id = ? and user_id = ?', @group.id, current_user.id])
  end
 def new
    @group = Group.new

 end
  def edit
    @group = Group.find(params[:id])
  end
  def create
    @group = Group.new(params[:group])
     @group.user = @current_user
      if @group.save
        flash[:notice] = 'Group was successfully created.'
      redirect_to :action =>'index'
      else 
     render :action=> 'new'
    end
  end
  def update
    @group = Group.find(params[:id])
      if @group.update_attributes(params[:group])
        flash[:notice] = 'Group was successfully updated.'
       redirect_to :action =>'show'
      else
      render :action=> 'edit'
    end
  end
  def destroy
    @group = Group.find(params[:id])
    @group.destroy
   redirect_to :action =>'action'
  end
  
  def group_join
    @group_join = GroupJoin.new
    @group_join.user_id = current_user.id
    @group_join.group_id = params[:id]
   if @group_join.save
        flash[:notice] = 'Join was successfully created.'
        redirect_to :action=>'index'
      else
        render :action=>'new'
       flash[:notice] = 'Join  was not successfully created.'
      end
end
 def my_groups
  @mygroups = Group.find(:all,:conditions => ['user_id = ?', current_user.id])
 end


end
