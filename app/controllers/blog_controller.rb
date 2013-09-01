class BlogController < ApplicationController
  before_filter :authenticate_user!, only: [:new,:create]
  before_filter :is_admin, only: [:new,:create]
  def index
  	@posts = Post.order("created_at DESC");
  end  
  def new    
  	@post = Post.new
  end
  def create    
  	@post = Post.new(params[:post])
  	@post.save()
  	redirect_to :action => :show, :id => @post.id
  end
  def show
  	@post = Post.find(params[:id])
  end
end
