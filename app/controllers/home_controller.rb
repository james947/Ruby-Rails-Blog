class HomeController < ApplicationController
  def index
  end
  def about
  end
  def newpost
  end
  def addpost
    redirect_to root_path
  end
end
