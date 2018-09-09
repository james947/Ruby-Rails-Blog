class HomeController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
    @posts = Post.all
  end

  def about
  end

  def edit
  end

  def newpost
    @categories = Category.all.order("created_at DESC") 
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = "The post was created!" 
      redirect_to posts_path
    else 
    flash[:errors] = @post.errors.full_messages
      redirect_to "/posts/new"
    end 
  end

  def posts
    if params[:category_id].blank?
      @posts = Post.all.order("created_at DESC")
      @categories = Category.all.order("created_at DESC")
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).order("created_at DESC")
    end
  end

  def show
    @post = Post.find_by(id:params[:id])
  end

  def update
    if @post.update(post_params)
      flash[:success] = "Update successful" 
      redirect_to @post
    else
      render ‘edit’
    end
  end

  def destroy
    @post.destroy
    flash[:success] = "Post deleted" 
    redirect_to root_path
  end

  private
  def post_params
    params. permit(:title, :subtitle, :content, :category_id, :author)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end

