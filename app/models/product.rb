class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 1..5000 }

  def discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def supplier
    Supplier.find_by(id: supplier_id)
  end
end
