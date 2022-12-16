class ItemsController < ApplicationController
    def index
        @items = Item.all
    end

    def new
       @item = Item.new
    end

    def edit
        @items = Item.all
    end

    private

    def item_params
        params.require(:item).permit(:product_name, :exception, :category_id, :situation_id, :shipping_charge_id, :region_of_origin_id, :number_of_day_id, :price, :image).merge(user_id: current_user.id)
    end
end
