class DetailsToClients < ActiveRecord::Migration[5.0]
  def change
    add_column :clients, :postcode, :string
    add_column :clients, :phone, :string
    add_column :clients, :email, :string
  end
end
