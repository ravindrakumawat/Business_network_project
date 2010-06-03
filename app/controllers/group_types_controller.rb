class GroupTypesController < ApplicationController
  
  before_filter :login_required
  layout 'application'
  def index
    @group_types = GroupType.all
  end
  def show
    @group_type = GroupType.find(params[:id])
  end
  def new
    @group_type = GroupType.new
 end
 def edit
    @group_type = GroupType.find(params[:id])
  end
  def create
    @group_type = GroupType.new(params[:group_type])
     if @group_type.save
        flash[:notice] = 'GroupType was successfully created.'
        redirect_to :action=> 'index'
    else
      render :action => 'new'
     end
   end
 def update
    @group_type = GroupType.find(params[:id])
  if @group_type.update_attributes(params[:group_type])
        flash[:notice] = 'GroupType was successfully updated.'
        redirect_to :action => 'show', :id=> @group_type
   else
      render :action => 'edit'
  end
 end
  def destroy
    @group_type = GroupType.find(params[:id])
    @group_type.destroy
    render :action =>'index'
  end
end
