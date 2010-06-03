class IndustriesController < ApplicationController
 before_filter :login_required
  def index
    @industries = Industry.all
  end

  def show
    @industry = Industry.find(params[:id])
  end

  def new
    @industry = Industry.new
   end

 
  def edit
    @industry = Industry.find(params[:id])
  end

  def create
    @industry = Industry.new(params[:industry])

      if @industry.save
        flash[:notice] = 'Industry was successfully created.'
        redirect_to(@industry) 
      else
        render :action => "new" 
    end
  end

  def update
    @industry = Industry.find(params[:id])

      if @industry.update_attributes(params[:industry])
        flash[:notice] = 'Industry was successfully updated.'
        redirect_to(@industry)
      else
        render :action => "edit"
    end
  end


  def destroy
    @industry = Industry.find(params[:id])
    @industry.destroy

    respond_to do |format|
      format.html { redirect_to(industries_url) }
      format.xml  { head :ok }
    end
  end
end
