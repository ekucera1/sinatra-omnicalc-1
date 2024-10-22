require "sinatra"
require "sinatra/reloader"

get("/goodbye") do
  erb(:bye)
end

get("/square/new") do
  erb(:new_square_calc)
end

get '/square/results' do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 2

  erb(:square_results)
end

get("/square_root/new") do
  erb(:new_square_root_calc)
end

get '/square_root/results' do
  @the_num = params.fetch("users_number").to_f

  @the_result = @the_num ** 0.5

  erb(:square_root_results)
end

get("/payment/new") do
  erb(:new_payment_calc)
end

get '/payment/results' do
  @the_apr = params.fetch("user_apr").to_f
  @the_yr = params.fetch("user_years").to_f
  @the_pv = params.fetch("user_pv").to_f

  @monthly = @the_apr/12
  @payments = @the_yr*12
  @resulty = @the_pv*12
  @denomn = 1 - (1 + @monthly) ** -@payments
  @the_result = @resulty/@denomn

  erb(:payment_results)
end


get("/") do
  "
  <h1>Welcome to your Sinatra App!</h1>
  <p>Define some routes in app.rb</p>
  "
end
