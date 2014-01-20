class ArticleController < ApplicationController
  def index
  end

  def create
  	tags = params[:article][:tags].split(',')
  	params[:article].delete :tags
  	

  	@article = Article.new(params[:article])
  	@article.save()
  	redirect_to :action => :show, :id => @article.id

  end

  def new
  	@article = Article.new
  end

  def show
  	@article = Article.find(params[:id])
  end

end
