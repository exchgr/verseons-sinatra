require 'sinatra'
require 'sinatra-websocket'
require 'sinatra/asset_pipeline'
require 'sprockets-helpers'
require 'rest-client'
require 'json'

set :sockets, []
register Sinatra::AssetPipeline

configure do
  set :public_folder, Proc.new { File.join(root, "assets") }
end

get '/' do
  if request.websocket?
    # do some shit
  else
    url = 'http://api.tumblr.com/v2/tagged?tag=poetry&api_key=BZ9B9jwlNu5TomackdGqorvMjMz7mJF8kDl8osWpeM8RnO9KTf'
    response = RestClient.get(url)
    @parsed = JSON.parse(response)
    haml :index
  end
end
