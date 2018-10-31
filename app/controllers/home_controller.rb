# frozen_string_literal: true

class HomeController < ApplicationController
  before_action :find_post, only: %i[show edit update destroy]

  def index
    @pagy, @posts = pagy(Post.all.order(created_at: :desc))
  end

  def about; end

  def edit
    @category = Category.find_by(id: @post.category_id)
    @categories = Category.all.order('created_at DESC')
  end

  def newpost
    @categories = Category.all.order('created_at DESC')
  end

  def create
    @post = Post.new(post_params)
    if @post.save
      flash[:success] = 'The post was created!'
      redirect_to posts_path
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to posts_new_path
    end
  end

  def posts
    if params[:category_id].blank?
      @pagy, @posts = pagy(Post.all.order(created_at: :desc), items: 5)
      @categories = Category.all.order(created_at: :desc)
    else
      @category_id = Category.find_by(name: params[:category]).id
      @posts = Post.where(category_id: @category_id).order(created_at: :desc)
    end
  end

  def show
    @post = Post.find_by(id: params[:id])
  end

  def update
    if @post.update(post_params)
      flash[:success] = 'Update successful'
      redirect_to update_path(@post.id)
    else
      flash[:errors] = @post.errors.full_messages
      redirect_to edit_path(@post.id)
    end
  end

  def destroy
    @post.destroy
    flash[:success] = 'Post deleted'
    redirect_to posts_path
  end

  private

  def post_params
    params. permit(:title, :subtitle, :content, :category_id, :author, :image)
  end

  def find_post
    @post = Post.find(params[:id])
  end
end
