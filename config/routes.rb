Rails.application.routes.draw do
  get "/all_products_url" => "products#all_products_method"
  get "/first_product_url" => "products#first_product_method"
  get "/sixth_product_url" => "products#sixth_product_method"
  get "/one_product_url" => "products#one_product_method"
  get "/one_product_url/:id" => "products#one_product_method"
end
