class ArticleController < ApplicationController
  before_filter :authenticate_user!, only: [:new,:create]
  before_filter :is_admin, only: [:new,:create]

  def index
    @articles = Article.getAll()
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


  def show_url
    @article = Article.find_by_url(params[:path])
    render "show"
  end

  def show_tag
    @tagname = params[:tagname]
    @articles = Article.getByTag(params[:tagname])
    render "index"
  end

  def show
  	@article = Article.find(params[:id])
    if !@article.url.blank?
      redirect_to "/"+@article.url
    end
  end

end
