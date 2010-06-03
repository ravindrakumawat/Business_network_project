class BillingInfosController < ApplicationController

  before_filter :login_required
  def index
    @billing_infos = BillingInfo.all
  end

  def show
   # @billing_info = BillingInfo.find(params[:id])
  end

  def new
    @billing_info = BillingInfo.new
  end

  def edit
    @billing_info = BillingInfo.find(params[:id])
  end

  def create
    @billing_info = BillingInfo.new(params[:billing_info])

      if @billing_info.save
        flash[:notice] = 'BillingInfo was successfully created.'
        redirect_to(@billing_info)
      else
        render :action => "new"
      end
  end

  def update
    @billing_info = BillingInfo.find(params[:id])

      if @billing_info.update_attributes(params[:billing_info])
        flash[:notice] = 'BillingInfo was successfully updated.'
        redirect_to(@billing_info)
      else
        render :action => "edit"
      end
  end

  def destroy
    @billing_info = BillingInfo.find(params[:id])
    @billing_info.destroy

    respond_to do |format|
      format.html { redirect_to(billing_infos_url) }
      format.xml  { head :ok }
    end
  end
end
