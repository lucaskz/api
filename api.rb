require 'sinatra'
require 'sinatra/activerecord'

class Resource < ActiveRecord::Base; end

get '/' do
"aguante christian tracy"
end

get '/crear' do
  Resource.create(name: "David", description: "Code Artist")
end

get '/resources/:id' do
  content_type :json
  resource_id = params[:id] # o #{params[:name]}
  {:resources => Resource.find_by(id:resource_id)}.to_json
end

get '/resources' do
  content_type :json
  #aca devuelvo las cosas 
  {:resources => Resource.all}.to_json
end

not_found do
  'Sorry... URL not found :('
end