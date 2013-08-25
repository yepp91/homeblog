class BlogController < ApplicationController
  def index
  	@posts = Post.all
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
