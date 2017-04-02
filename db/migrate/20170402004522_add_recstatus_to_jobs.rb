class AddRecstatusToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :recstatus, :string
  end
end
