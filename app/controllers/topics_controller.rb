class TopicsController < ApplicationController
  before_filter :load_forum
    def load_forum
    @forum = Forum.find(params[:forum_id])
  end
  # GET /topics
  # GET /topics.xml
  def index
   @topics = @forum.topics
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @topics }
    end
  end

  # GET /topics/1
  # GET /topics/1.xml
  def show
    @topic = @forum.topics.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/new
  # GET /topics/new.xml
  def new
   @topic = @forum.topics.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @topic }
    end
  end

  # GET /topics/1/edit
  def edit
  @topic = @forum.topics.find(params[:id])
  end

  # POST /topics
  # POST /topics.xml
  def create
    @topic = @forum.topics.build(params[:topic])

    respond_to do |format|
      if @topic.save
        flash[:notice] = 'Topic was successfully created.'
        format.html { redirect_to(@forum) }
        format.xml  { render :xml => @topic, :status => :created, :location => @topic }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end
  # PUT /topics/1
  # PUT /topics/1.xml
  def update
   @topic = @forum.topics.find(params[:id])

    respond_to do |format|
      if @topic.update_attributes(params[:topic])
        flash[:notice] = 'Topic was successfully updated.'
        format.html { redirect_to(@forum) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @topic.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /topics/1
  # DELETE /topics/1.xml
  def destroy
  @topic = @forum.topics.find(params[:id])
    @topic.destroy

    respond_to do |format|
     format.html { redirect_to(forum_topics_url(@forum)) }
      format.xml  { head :ok }
    end
  end

end
