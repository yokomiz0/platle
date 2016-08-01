class CreateShops < ActiveRecord::Migration
  def change
    create_table :shops do |t|
      t.string :address
      t.string :shop_code
      t.string :image
      t.string :url

      t.timestamps null: false
    end
  end
end
