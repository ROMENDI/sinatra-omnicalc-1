require "sinatra"
require "sinatra/reloader"

get("/howdy") do 
  erb(:hello)
end 

get("/square/new") do 
  erb(:new_square_calc)
end 
get("/square/results") do 
  @the_num = params.fetch("users_number").to_f
  @the_result = params.fetch("users_number").to_f ** 2
  erb(:square_results)
end 

get("/square_root/new") do 
  erb(:new_square_root_calc)
end 

get("/square_root/results") do 
  @the_num = params.fetch("users_number").to_f
  @the_result = Math.sqrt(@the_num)
  erb(:square_root_results)
end 

get("/random/new") do 
  erb(:new_random_calc)
end 

get("/random/results") do 
  min = params.fetch("min_number").to_f
  max = params.fetch("max_number").to_f
  @the_result = rand(min..max)
  erb(:random_results)
end 

get("/payment/new") do 
  erb(:new_payment_calc)
end 

get("/payment/results") do 
  apr = params.fetch("apr").to_f / 100
  years = params.fetch("years").to_i
  principal = params.fetch("principal").to_f
  monthly_rate = apr / 12
  months = years * 12
  payment = principal* (monthly_rate / (1 - (1 + monthly_rate) ** -months))

  @formatted_apr = (apr*100).to_fs(:percentage, {:precision => 4})
  @formatted_years = years.to_i
  @formatted_pv = principal.to_fs(:currency)
  @monthly_payment = payment.to_fs(:currency)

  erb(:payment_results)
end 

get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
