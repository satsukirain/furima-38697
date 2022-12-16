class CreateItems < ActiveRecord::Migration[6.0]
  def change
    create_table :items do |t|
      t.string     :product_name, null: false
      t.text       :explanation, null: false
      t.integer    :category_id, null: false
      t.integer    :situation_id, null: false
      t.integer    :shipping_charge_id, null: false
      t.integer    :region_of_origin_id, null: false
      t.integer    :number_of_day_id, null: false
      t.integer    :price, null: false
      t.references :user, null: false, foregin_key: true
      t.timestamps
    end
  end
end
