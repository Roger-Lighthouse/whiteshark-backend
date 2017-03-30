class CreatePrices < ActiveRecord::Migration[5.0]
  def change
    create_table :prices do |t|
      t.references :client, index: true, foreign_key: true
      t.decimal :w1
      t.decimal :eh
      t.timestamps
    end
  end
end
