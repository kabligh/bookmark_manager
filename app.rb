require 'sinatra/base'
require 'sinatra/flash'
require './lib/bookmark'
require './database_connection_setup'
require 'uri'

class BookmarkManager < Sinatra::Base
  enable :sessions, :method_override
  register Sinatra::Flash

  configure do
    # allows sinatra to find my CSS stylesheet
    set :public_folder, File.expand_path('../public', __FILE__)
    set :views        , File.expand_path('../views', __FILE__)
    set :root         , File.dirname(__FILE__)
  end

  get '/' do
    erb(:home)
  end

  get '/bookmarks' do
    @bookmarks = Bookmark.all
    erb(:'bookmarks/index')
  end

  post '/bookmarks' do
    if params['url'] =~ /\A#{URI::regexp(['http', 'https'])}\z/
      Bookmark.create(url: params[:url], title: params[:title])
    else
      flash[:notice] = "You must submit a valid URL."
    end
    redirect '/bookmarks'
  end

  delete '/bookmarks/:id' do
    Bookmark.delete(id: params[:id])
    redirect('/bookmarks')
  end

  get '/bookmarks' do
    erb(:'bookmarks')
  end

  get "/bookmarks/:id/edit" do
    @bookmark = Bookmark.find(id: params[:id])
    erb(:'bookmarks/edit')
  end

  patch "/bookmarks/:id" do
    Bookmark.update(id: params[:id], url: params[:url], title: params[:title])
    redirect('/bookmarks')
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
