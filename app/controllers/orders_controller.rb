class OrdersController < ApplicationController
    before_action :authenticate_user!, only: [ :index ]
    before_action :set_item, only: [ :index, :create]
  
    def index
       if @item.user_id != current_user.id
         @form_address = FormAddress.new
       else
         redirect_to root_path
       end
       unless @item.order.present?
         @form_address = FormAddress.new
       end
       if @item.order.present? && @item.user_id != current_user.id
         redirect_to root_path
       end
    end
  
    def create
      @form_address = FormAddress.new(order_params)
       if @form_address.valid?
       order_payment
        @form_address.save
        redirect_to root_path
       else
         render :index
       end
    end
  
  
    private
  
    def order_params
      params.require(:form_address).permit(:post_code, :region_of_origin_id, :municipalities, :address, :building, :phone_number).merge(user_id: current_user.id, item_id: params[:item_id], token: params[:token])
    end
  
    def order_payment 
      Payjp.api_key = ENV["PAYJP_SECRET_KEY"]
      Payjp::Charge.create( amount: @item.price, card: order_params[:token], currency: 'jpy' )
     end
  
    def set_item
      @item = Item.find(params[:item_id])
    end
end
  
  