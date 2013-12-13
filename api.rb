require 'sinatra'
require 'sinatra/activerecord'
require 'jbuilder'

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
  resources = Resource.all
	Jbuilder.encode do |json|


		json.resources do
		  json.array! @resources do |r|
		    json.name r.name
		    json.description r.description
		  end
		end
  end

end

get '/prueba' do
  content_type :json
  h= {resources: []}
  Resource.all.each do |e|
  	resource = {
  		id: e.id,
  		name: e.name,
  		description: e.description,
  		links: [{
  			rel: 'self',
  			uri: 'http://localhost.com'
  		}
  		]
  	}
  	h[:resources].push(resource)
  end 
  h.to_json
end

not_found do
  'Sorry... URL not found :('
end