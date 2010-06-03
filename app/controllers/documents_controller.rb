class DocumentsController < ApplicationController

  before_filter :login_required
  layout 'application'
  def index
    @documents = Document.all   
  end
 def show
    @document = Document.find(params[:id])
   end
 def new
    @document = Document.new  
 end
 def edit
    @document = Document.find(params[:id])
  end
 def create
    @document = Document.new(params[:document])
  if @document.save
        flash[:notice] = 'Document was successfully created.'
  redirect_to(@document)
  else
   render :action => "new" 
  end
  end
  def update
    @document = Document.find(params[:id])
  if @document.update_attributes(params[:document])
        flash[:notice] = 'Document was successfully updated.'
        redirect_to(@document)
      else
    render :action => "edit"
 end
 end
 def destroy
    @document = Document.find(params[:id])
    @document.destroy
 redirect_to(documents_url) 
 end
end

