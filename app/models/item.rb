class Item < ApplicationRecord
        belongs_to :user
        has_one_attached :image
      
        extend ActiveHash::Associations::ActiveRecordExtensions
        belongs_to :category
        belongs_to :situation
        belongs_to :shipping_charge
        belongs_to :region_of_origin
        belongs_to :number_of_day
      
        with_options presence: true do 
          validates :product_name
          validates :explanation
          validates :image
          # validates :price
      
          with_options  numericality: { other_than: 0 } do
            validates :category_id
            validates :situation_id
            validates :shipping_charge_id
            validates :region_of_origin_id
            validates :number_of_day_id
            
          end
          
        end
      
        validates_inclusion_of :price, in: (300..9999999), format: {with: /\A[0-9]+\z/ }
        validates :price, presence: true, numericality: {only_integer: true,greater_than_or_equal_to: 300, less_than_or_equal_to: 9999999}
end
