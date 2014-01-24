class BlogsController < ApplicationController
  before_filter :authenticate_user!, only: [:new,:create,:edit]
  before_filter :is_admin, only: [:new,:create]
  def index #главная блога. выборка всех постов.
  	@posts = Blog.paginate(:page => params[:page], :per_page => 3).order('id DESC');
  end  
  def new    #форма создания поста
  	@post = Blog.new    
  end
  def create    #создать пост
  	@post = Blog.new(params[:post])
  	@post.save()
  	redirect_to :action => :show, :id => @post.id
  end
  def show  #показать один пост
  	@post = Blog.find(params[:id])    
  end

  def edit
    @post = Blog.find(params[:id])
    @send_path =  edit_blog_path
    render "new"
  end

  def update
      @post = Blog.find(params[:blog][:id])
      @post.update_attributes(params[:blog])
      @post.save
      redirect_to :action => :show, :id => @post.id 
  end
end
