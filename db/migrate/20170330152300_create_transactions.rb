class CreateTransactions < ActiveRecord::Migration[5.0]
  def change
    create_table :transactions do |t|
      t.references :job, index: true, foreign_key: true
      t.string :tran_type
      t.string :tran_method
      t.decimal :amount
      t.date :tran_date
      t.timestamps
    end
  end
end
