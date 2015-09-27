class CreateContents < ActiveRecord::Migration
  def change
    create_table :contents do |t|
      t.text :properties, :null => false
      t.integer :domain_id, :null => false

      t.timestamps null: false
    end
  end
end
