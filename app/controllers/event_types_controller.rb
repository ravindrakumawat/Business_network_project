class EventTypesController < ApplicationController
   include AuthenticatedSystem
 #include ApplicationHelper
  before_filter :login_from_cookie
  def index
    @event_types = EventType.all
  end

  def show
    @event_type = EventType.find(params[:id])
  end

    def new
    @event_type = EventType.new
  end
  
  def edit
    @event_type = EventType.find(params[:id])
  end

  
  def create
    @event_type = EventType.new(params[:event_type])

      if @event_type.save
        flash[:notice] = 'EventType was successfully created.'
        redirect_to :action => 'index'
      else
        redirect_to :action => 'new'
      end
  end

  def update
    @event_type = EventType.find(params[:id])

   
      if @event_type.update_attributes(params[:event_type])
        flash[:notice] = 'EventType was successfully updated.'
        redirect_to(@event_type)
      else
        redirect_to :action => 'new'
      end
  end

 
  def destroy
    @event_type = EventType.find(params[:id])
    @event_type.destroy

    respond_to do |format|
      format.html { redirect_to(event_types_url) }
      format.xml  { head :ok }
    end
  end
end
