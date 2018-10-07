class ApplicationController < ActionController::Base
  include Pagy::Backend
  rescue_from Pagy::OutOfRangeError, with: :redirect_to_last_page

  private

  def redirect_to_last_page(e)
    redirect_to url_for(page: e.pagy.last), notice: "Page ##{params[:page]} is out of range. Showing page #{e.pagy.last} instead."
  end
end
