class CreateJobs < ActiveRecord::Migration[5.0]
  def change
    create_table :jobs do |t|
      t.references :client, index: true, foreign_key: true
      t.string :jobdesc
      t.decimal :price
      t.date :sdate
      t.string :stime
      t.date :datebi
      t.string :crew
      t.timestamps
    end
  end
end
