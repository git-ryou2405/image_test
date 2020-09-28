class CreateShopFiles < ActiveRecord::Migration[6.0]
  def change
    create_table :shop_files do |t|
      t.string :file
      t.string :shop_id
      
      t.timestamps
    end
  end
end
