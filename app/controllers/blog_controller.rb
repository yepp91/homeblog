class BlogController < ApplicationController
  before_filter :authenticate_user!, only: [:new,:create,:edit]
  before_filter :is_admin, only: [:new,:create]
  def index #главная блога. выборка всех постов.
  	@posts = Post.paginate(:page => params[:page], :per_page => 3).order('id DESC');
  end  
  def new    #форма создания поста
  	@post = Post.new
    @send_url = "create"
  end
  def create    #создать пост
  	@post = Post.new(params[:post])
  	@post.save()
  	redirect_to :action => :show, :id => @post.id
  end
  def show  #показать один пост
  	@post = Post.find(params[:id])    
  end

  def edit
    @post = Post.find(params[:id])
    @send_url = "save"  
    render "new"
  end

  def save
      @post = Post.find(params[:post][:id])
      @post.update_attributes(params[:post])
      @post.save
      redirect_to :action => :show, :id => @post.id 
  end
end
