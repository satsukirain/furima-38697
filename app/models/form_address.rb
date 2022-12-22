class FormAddress
    include ActiveModel::Model
    attr_accessor :post_code, :region_of_origin_id, :municipalities, :address, :building, :phone_number, :user_id, :item_id,  :token
    
      # ここにバリデーションの処理を書く
      #空の投稿を保存できないようにする
      with_options presence: true do
       validates :post_code, format: {with: /\A[0-9]{3}-[0-9]{4}\z/, message: "は半角数値の3桁(-)4桁で入力してください"}
       validates :region_of_origin_id
       validates :municipalities              
       validates :address
       validates :phone_number, format: {with: /\A\d{10}$|^\d{11}\z/,  message: "は半角数値の10桁から11桁以内に入力してください"}
       validates :user_id
       validates :item_id
       validates :token
      end
      #都道府県の選択が「---」の時は保存できないようにする
       validates :region_of_origin_id, numericality: { other_than: 1, message: "は---以外を入力してください"}
  
  
  
      # 各テーブルにデータを保存する処理を書く
    def save
      order = Order.create(user_id: user_id, item_id: item_id)
      Address.create(post_code: post_code, region_of_origin_id: region_of_origin_id, municipalities: municipalities, address: address, building: building, phone_number:  phone_number, order_id: order.id)
    end
end
    