require 'sinatra'

set :port, 8080
set :public_folder, File.dirname(__FILE__) + '/public'
#set :root, File.dirname(__FILE__)


get '/' do
  erb :index
end

get '/index.html' do
  @page_title = 'Login'
  @page_id = 'index.html'
  erb :'index.html', { :layout => :'layout.html' }
  #erb :index
end

get 'upload' do
  erb :form
end

post '/save_image' do
  
  @filename = params[:file][:filename]
  file = params[:file][:tempfile]

  File.open("./public/files_uploaded/#{@filename}", 'wb') do |f|
    f.write(file.read)
  end
  
  erb :show_image
end

