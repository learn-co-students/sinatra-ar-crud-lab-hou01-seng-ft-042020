
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    set :method_override, true
  end

  get '/' do
    'Hello World~!!'
  end

  get '/articles/new' do
    erb :new
  end

  get '/articles' do
    @articles = Article.all 
    erb :index
  end
 
  get '/articles/:id' do
    # binding.pry
    @article = current_article
    erb :show
  end

  get '/articles/:id/edit' do
    @article = current_article
    erb :edit
  end
  
  post '/articles' do
    article = Article.create(params)
    redirect "/articles/#{article.id}"
  end

  patch '/articles/:id' do
    article = current_article
    article.update(title: params[:title], content: params[:content])
    redirect "/articles/#{article.id}"
  end

  delete '/articles/:id' do
    article = current_article
    article.destroy
    redirect "/articles"
  end
  
  def current_article
    @article = Article.find(params[:id])
  end


end
