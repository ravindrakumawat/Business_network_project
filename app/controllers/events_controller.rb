class EventsController < ApplicationController
  
before_filter :login_required
  def index
  @search = Event.search(params[:search])
  @events = @search.paginate(:all,:order => "id DESC",:page => params[:page],:per_page => 6)

  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
  end

  def edit
    @event = Event.find(params[:id])
  end

  def create
    @event = Event.new(params[:event])

      if @event.save
        flash[:notice] = 'Event was successfully created.'
        redirect_to :action => 'index'
    else
        render :action => "new" 
    end
  end

  def update
    @event = Event.find(params[:id])

      if @event.update_attributes(params[:event])
        flash[:notice] = 'Event was successfully updated.'
        redirect_to :action=> 'index'
      else
        render :action => "edit" 
    end
  end

  def destroy
    @event = Event.find(params[:id])
    @event.destroy
    redirect_to(events_url)
  end

  def myevents
     @search = Event.search(params[:search])
     @myevents = @search.paginate(:all,:conditions => ['user_id = ?', current_user.id],:page =>params[:page],:per_page => 6)
  end

  def find_events
  @search = Event.search(params[:search])
  @events = @search.paginate(:all,:order => "id DESC",:page => params[:page],:per_page => 6)
  end 
end
