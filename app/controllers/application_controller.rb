
require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/' do
  end
  
  # New - loads a form
  get '/articles/new' do
    erb :"articles/new"
  end
  
  # Create - processes the form and creates an article
  post '/articles' do
    article = Article.create(params)
    redirect '/articles/#{article.id}'
  end
  
  # Index - loads all of the articles
  get '/articles' do
    @articles = Article.all
    erb :"articles/index"
  end
  
  # Show - gets details on a specific article
  get '/articles/:id' do
    @article = Article.find_by(id: params[:id])
    if @article
      erb :"articles/show"
    else
      redirect "/articles"
    end
  end


end
