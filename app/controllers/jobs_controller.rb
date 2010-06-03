class JobsController < ApplicationController
  before_filter :login_required
  
  def index
     @search = Job.search(params[:search])
    @jobs = @search.paginate(:all,:order => "id DESC",:page => params[:page],:per_page => 5)
    end
  def show
    @job = Job.find(params[:id])
  end

  def new
  @job = Job.new
  end
 def edit
    @job = Job.find(params[:id])
  end
 def create
    @job = Job.new(params[:job])
     @job.user = @current_user
    if @job.save
        flash[:notice] = 'Job was successfully created.'
        redirect_to :action=> 'index'
    else
       render :action => 'new'
    end
  end
 def update
    @job = Job.find(params[:id])
    if @job.update_attributes(params[:job])
        flash[:notice] = 'Job was successfully updated.'
        redirect_to :action=> 'index'
    else
       render :action => 'edit'
    end
    end
  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to(jobs_url) 
   end

 def advance_search
  @search = Job.search(params[:search])
  @jobs = @search.paginate(:all,:order => "id DESC",:page => params[:page],:per_page => 5)
 
 end

 end
