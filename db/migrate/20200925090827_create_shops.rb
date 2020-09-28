class CreateShops < ActiveRecord::Migration[6.0]
  def change
    create_table :shops do |t|
      t.string :name
      t.string :image
      t.json :imgs
      
      t.timestamps
    end
  end
end
