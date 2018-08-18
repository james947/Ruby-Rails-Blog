class HomeController < ApplicationController
  before_action :find_post, only: [:show, :edit, :update, :destroy]

  def index
  end

  def about
  end

  def edit
  end

  def newpost
     @post = Post.newpost
  end

  def addpost
    @post = Post.newpost(post_params)
    if @post.save
      flash[:success] = "The post was created!" 
      redirect_to @post
    else 
      render ‘newpost’
    end 
  end

  def posts
    @posts = Post.all
    @categories = Category.all
  end



  def show
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
    params.require(:post).permit(:title, :content, :category_id, :author)
  end

  def find_post
    @post = Post.find(params[:id])
  end

end

