require "unirest"
require "tty-prompt"

system "clear"

prompt = TTY::Prompt.new
options = ["See all products", "See first product"]
choice = prompt.select("Welcome! Choose an option", options)

if choice == options[0]
  response = Unirest.get("http://localhost:3000/all_products_url")
  products = response.body
  pp products
elsif choice == options[1]
  response = Unirest.get("http://localhost:3000/first_product_url")
  product = response.body
  pp product
else
  puts "Unknown option"
end
