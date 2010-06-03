class MessagesController < ApplicationController
  layout 'home'
  def index
 @messages = Message.find(:all, :conditions => {:receiver => current_user.login})
# @messages_grid = initialize_grid(Message) #,:conditions => {:receiver => current_user.login})
 end
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def new
     @message = Message.new
      respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
  end

  def edit
    @message = Message.find(params[:id])
  end

  def create
    #@message = Message.new(params[:message])
    puts params[:messages]
    @message = Message.new(params[:message])
    @message.user = current_user
   #if Message.exists?:receiver => @message.receiver
   if User.exists?:login => @message.receiver
     if @message.save
        flash[:notice] = 'message was successfully send.'
       redirect_to :action => 'sentbox'
        else
        render :action => "new"
       end
    else
       flash[:notice] = 'Message was not successfully send.'
       flash[:notice] = 'Receiver does not exist.'
        redirect_to :action => 'new'

          end
  end

  def update
    puts params[:messages]
    @message = Message.new(params[:message])
    @message.user = current_user

    respond_to do |format|

      if @message.save
        flash[:notice] = 'message was successfully send.'
        format.html { redirect_to(@message) }
        format.xml  { render :xml => @message, :status => :created, :location => @message }

        else
        format.html { render :action => "new" }
        format.xml  { render :xml => @message.errors, :status => :unprocessable_entity }
      end
    end
  end

  def sentbox
    # @message = Message.find(:all)
    @messages_grid = initialize_grid(Message,:conditions => {:user_id => current_user})
    @messages=Message.find(:all, :conditions => {:receiver => current_user})
   
      respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @messages }
    end
    
  end

  def destroy
    @message = Message.find(params[:id])
    @message.destroy

    respond_to do |format|
      format.html { redirect_to(messages_url) }
      format.xml  { head :ok }
    end
  end


 def new_method
   @message_find = Message.find(params[:id])
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @message }
    end
 end

 def reply
   @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @message }
    end
 end

 def inbox_show
 end

 def inbox
     @messages = Message.find(:all, :conditions => {:receiver => current_user.login})
 @messages_grid = initialize_grid(Message,:conditions => {:receiver => current_user.login})
 end
end
