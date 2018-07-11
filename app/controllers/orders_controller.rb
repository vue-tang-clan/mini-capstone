class OrdersController < ApplicationController
  def index
    @orders = current_user.orders
    render "index.json.jbuilder"
  end

  def create
    product = Product.find_by(id: params[:product_id])
    quantity = params[:quantity].to_i
    calculated_subtotal = product.price * quantity
    calculated_tax = product.tax * quantity
    calculated_total = product.total * quantity

    @order = Order.new(
      user_id: current_user.id,
      product_id: params[:product_id],
      quantity: params[:quantity],
      subtotal: calculated_subtotal,
      tax: calculated_tax,
      total: calculated_total,
    )
    @order.save
    render "show.json.jbuilder"
  end
end
