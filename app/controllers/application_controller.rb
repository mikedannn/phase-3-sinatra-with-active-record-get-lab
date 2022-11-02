class ApplicationController < Sinatra::Base

  set :default_content_type, 'application/json'

  get '/bakeries' do 
    # get all the bakeries from the database
    bakeries = Bakery.all
    bakeries.to_json
    # send them back as a JSON array
  end

  get '/bakeries/:id' do 
    bakery = Bakery.find(params[:id])
    bakery.to_json(include: :baked_goods)
  end

  get '/baked_goods/by_price' do
    baked_goods = BakedGood.all.order(:price).reverse
    baked_goods.to_json
  end

  get '/baked_goods/most_expensive' do
    baked_goods = BakedGood.all.order(:price).reverse.first
    baked_goods.to_json
  end

end
