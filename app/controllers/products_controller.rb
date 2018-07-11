class ProductsController < ApplicationController
  before_action :authenticate_admin, except: [:index, :show]

  def index
    @products = Product.all

    search_terms = params[:search]
    if search_terms
      @products = @products.where("name ILIKE ?", "%" + search_terms + "%")
    end

    if params[:sort_by_price]
      @products = @products.order(price: :asc)
    else
      @products = @products.order(id: :asc)
    end

    render "index.json.jbuilder"
  end

  def create
    @product = Product.new(
      name: params[:name],
      price: params[:price],
      description: params[:description],
      supplier_id: 1
    )
    if @product.save
      image = Image.new(url: params[:image_url], product_id: @product.id)
      image.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def show
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    render "show.json.jbuilder"
  end

  def update
    product_id = params["id"]
    @product = Product.find_by(id: product_id)
    @product.name = params[:name] || @product.name
    @product.price = params[:price] || @product.price
    @product.description = params[:description] || @product.description
    if @product.save
      render "show.json.jbuilder"
    else
      render json: {errors: @product.errors.full_messages}, status: :unprocessable_entity
    end
  end

  def destroy
    product_id = params["id"]
    product = Product.find_by(id: product_id)
    product.destroy
    render json: {message: "Successfully destroyed product!"}
  end
end
