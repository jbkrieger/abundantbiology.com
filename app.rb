require 'sinatra'
require 'haml'
require 'sass'
require 'compass'

set :app_file, __FILE__
set :root, File.dirname(__FILE__)
set :views, "views"
set :public_folder, 'public'

configure do
  Compass.add_project_configuration(File.join(Sinatra::Application.root, 'config', 'compass.config'))
end

get '/' do
  haml :index
end

get '/styles/:name.css' do
  content_type 'text/css', :charset => 'utf-8'
  sass(:"styles/#{params[:name]}", Compass.sass_engine_options )
end
