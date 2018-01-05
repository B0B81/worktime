class OrdersController < ApplicationController

  def index
    @orders = Order.all
  end

  def show
  end

  def get_order_description
    if Order.exists?(ordernumber: params[:ordernumber])
      @order_description = Order.find_by_ordernumber(params[:ordernumber])
      #@order_description = Order.select(:description).find_by ordernumber: params[:ordernumber]
    end
    if request.xhr?
      respond_to do |format|
        format.json { render :json => @order_description }
      end
    end
  end

  private

    def find_order
      @order = Order.find(params[:id])
    end

    def order_params
      params.require(:order).permit(:ordernumber, :description)
    end
    
  end
