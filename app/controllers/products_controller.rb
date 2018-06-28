class ProductsController < ApplicationController
  def all_products_method
    @products = Product.all
    render "all_products.json.jbuilder"
  end

  def first_product_method
    @product = Product.first
    render "one_product.json.jbuilder"
  end

  def sixth_product_method
    @product = Product.find_by(id: 6)
    render "one_product.json.jbuilder"
  end

  def one_product_method
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    render "one_product.json.jbuilder"
  end
end
