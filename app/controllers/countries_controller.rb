class CountriesController < ApplicationController
   def index
    @countries = Country.find(:all)
  end
 def show
    @country = Country.find(params[:id])
 end
  def new
    @country = Country.new
  end
  def edit
    @country = Country.find(params[:id])
  end
  def create
    @country = Country.new(params[:ad])
    if @country.save
      flash[:notice] = :country_was_successfully_created.l
     redirected_to :action => 'index'
    else
      render :action => "new"
    end
   end
  def update
    @country = Country.find(params[:id])
      if @country.update_attributes(params[:country])
        flash[:notice] = :country_was_successfully_updated.l
        redirect_to ad_url(@ad)
      else
     render :action => "edit"
       
      end
    end
   def destroy
    @country = Country.find(params[:id])
    @country.destroy
   redirect_to ads_url
  end

end
