class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string     :taobao_id
      t.string      :name
      t.text      :cover_url
      t.attachment  :cover
      t.text      :detail_url
      t.string      :category
      t.text      :taobao_url
      t.float       :price
      t.integer     :monthsales
      t.float       :income_rate
      t.float       :commission
      t.string      :seller_ww
      t.string      :seller_id
      t.string      :seller_name
      t.string      :seller_type
      t.string      :coupon_id
      t.integer     :coupon_total
      t.integer     :coupon_remainder
      t.string      :coupon_detail
      t.date        :coupon_start_date
      t.date        :coupon_end_date
      t.text      :coupon_url
      t.text      :coupon_spread_url


      t.integer  :position, default: 100000
      t.string   :status
      t.timestamps
    end
    add_index :coupons, :taobao_id
    add_index :coupons, :coupon_id
    add_index :coupons, :seller_id
  end
end
