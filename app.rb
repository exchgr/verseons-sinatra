require 'sinatra'
require 'sinatra-websocket'
require 'sinatra/asset_pipeline'
require 'sprockets-helpers'

set :sockets, []
register Sinatra::AssetPipeline

configure do
  set :public_folder, Proc.new { File.join(root, "assets") }
end

get '/' do
  if request.websocket?
    # do some shit
  else
    haml :index
  end
end
