class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.decimal :currentPrice

      t.timestamps
    end
  end
end
