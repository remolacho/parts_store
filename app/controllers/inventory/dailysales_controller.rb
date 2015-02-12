class Inventory::DailysalesController < ApplicationController
  before_action :authenticate_user!
  def index
  	begin
  	  @dailysales = Dailysale.where(status: "A").less_date(Time.new.strftime("%Y-%m-%d"))
  	rescue Exception => e
      @dailysales = Dailysale.where(status: "A").less_date(Time.new.strftime("%Y-%m-%d"))		
  	end
  end

  def show
  	@dailysale = Dailysale.find(params[:id])
    @inventory_sales = @dailysale.sales.includes(:item).order(id: :desc)
  end
  
end
