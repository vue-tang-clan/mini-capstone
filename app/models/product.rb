class Product < ApplicationRecord
  validates :name, presence: true
  validates :name, uniqueness: true
  validates :price, presence: true
  validates :price, numericality: { greater_than: 0 }
  validates :description, length: { in: 1..5000 }

  belongs_to :supplier
  # def supplier
  #   Supplier.find_by(id: supplier_id)
  # end

  has_many :images
  # def images
  #   Image.where(product_id: id)
  # end

  has_many :orders
  has_many :category_products
  has_many :categories, through: :category_products
  # def categories
  #   category_products.map { |category_product| category_product.category }
  # end


  def discounted?
    price < 10
  end

  def tax
    price * 0.09
  end

  def total
    price + tax
  end

  def image_urls
    images.map {|image| image.url}
  end

  def category_names
    categories.map {|category| category.name }
  end
end
