class AddNotesToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :notes, :string
  end
end
