
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end

  get '/articles' do
    @articles = Article.all
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles/new' do
    redirect "/articles/new"
  end

  get '/articles/:id' do
    @article = Article.find(params[:id])
    erb :show
  end

  post '/articles' do
    pup = Article.create(params)
    redirect "/articles/#{pup.id}"
  end

  get '/articles/:id/edit' do
    @article = Article.find(params[:id])
    erb :edit
  end

  post '/articles/:id/edit' do
    @article = Article.find(params[:id])
    redirect "/articles/#{@article.id}/edit"
  end

  patch '/articles/:id' do
    art = Article.find(params[:id])
    art.update(title: params[:title], content: params[:content])
    redirect "/articles/#{art.id}"
  end

  delete '/articles/:id' do
    Article.delete(params[:id])
    redirect "/articles"
  end
end
