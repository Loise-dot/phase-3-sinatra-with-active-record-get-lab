class ApplicationController < Sinatra::Base

  set :default_content_type, "application/json"

  # add routes
  get '/bakeries' do
    bakery = Bakery.all
    bakery.to_json
  end

  get '/bakeries/:id' do
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    bakery = BakedGood.order(price: :desc)
    bakery.to_json
  end

  get '/baked_goods/most_expensive' do
    bakery = BakedGood.order(price: :desc).first
    bakery.to_json(only: [:name, :price])
  end

end