
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end


  get "/articles" do
    @articles = Article.all 
    erb :index
  end

  get '/articles/new' do
    erb :new
  end

  post '/articles' do
    @article = Article.create(title: params[:title], content: params[:content])
    redirect "/articles/#{@article.id}"
  end

  get "/articles/:id" do
    @article = Article.find(params[:id])
    erb :show
  end

  # get '/articles/:id/edit' do
  #   @article = Article.find(params[:id])
  #   erb :edit
  # end

  # patch '/articles/:id' do
  #   @article = Article.find(params[:id])
  #   # binding.pry
  #   @article.update(params[:article])
  #   redirect "/articles/#{article.id}"
  # end



  # edit
  get "/articles/:id/edit" do
    @article = Article.find(params[:id])
    erb :edit
  end

  # update
  patch "/articles/:id" do
    @article = Article.find(params[:id])
    @article.update(params[:article])
    redirect to "/articles/#{ @article.id }"
  end

  delete '/articles/:id' do
    article = Article.find(params[:id])
    article.destroy 
    redirect "/articles"
  end

end






# <%=@article.title%><br>
# <%=@article.content%>


# <form method="post" action="/articles/<%=@article.id%>">
#   <input type="hidden" name="_method" value="patch">

#     <label>Title: </label>
#     <input id="title" type="text" name="@article.title" value="<%=@article.title%>"><br>

#     <label>Content: </label>
#     <input id="content" type="text" name="@article.content" value="<%=@article.content%>" >
#   <input type="submit"/>
# </form>
 











# <form action="/articles/<%= @article.id %>" method="post">
#   <input type="hidden" name="_method" value="patch">
#   <ul>
#     <li>
#       <label for="title">Title</label>
#       <input id="title" type="text" name="article[title]" value="<%= @article.title %>" />
#     </li>
#     <li>
#       <label for="content">Content</label>
#       <textarea id="content" type="text" name="article[content]"  value="<%= @article.content %>">
#       </textarea>
#     </li>
#   </ul>
#   <input type="submit" />
# </form>