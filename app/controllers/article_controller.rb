class ArticleController < ApplicationController
  def index
  end

  def create
  	tags_list = params[:article][:tags].split(',')
  	params[:article].delete :tags
  	@article = Article.new(params[:article])
    @article.save

    tags_list.each do |tag|
      @tag_m = Tags.add(tag)       
      Tag2article.add(@article,@tag_m)
    end

  	
  	redirect_to :action => :show, :id => @article.id

  end

  def new
  	@article = Article.new
  end

  def show
  	@article = Article.find(params[:id])
  end

end
