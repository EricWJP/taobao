class CreateCoupons < ActiveRecord::Migration[5.0]
  def change
    create_table :coupons do |t|
      t.string :title
      t.string :subtitle
      t.string :author_name
      t.text   :body, limit: 4294967295
      t.string :link

      t.string :summary, limit: 1000
      t.attachment :cover

      t.integer :comments_count, default: 0
      t.integer :praises_count, default: 0
      t.integer :visits_count, default: 0

      t.datetime :published_at

      t.integer  :kr36_id

      t.integer  :position
      t.string   :status
      t.timestamps
    end
  end
end
