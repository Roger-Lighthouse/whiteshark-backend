class Client < ApplicationRecord

  def prices
    prices = Price.where('client_id = ?', id)
    price = prices.first
  end
end
