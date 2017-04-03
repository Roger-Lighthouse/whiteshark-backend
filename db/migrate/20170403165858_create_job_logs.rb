class CreateJobLogs < ActiveRecord::Migration[5.0]
  def change
    create_table :job_logs do |t|
      t.references :job, index: true, foreign_key: true
      t.string :log_type
      t.date :log_date
      t.string :stime
      t.date :datebi
      t.string :comments
      t.timestamps
    end
  end
end





