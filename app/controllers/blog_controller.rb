class BlogController < ApplicationController
  before_filter :authenticate_user!, only: [:new,:create]
  before_filter :is_admin, only: [:new,:create]
  def index #главная блога. выборка всех постов.
  	@posts = Post.order("created_at DESC");
  end  
  def new    #форма создания поста
  	@post = Post.new
  end
  def create    #создать пост
  	@post = Post.new(params[:post])
  	@post.save()
  	redirect_to :action => :show, :id => @post.id
  end
  def show  #показать один пост
  	@post = Post.find(params[:id])    
  end
end
