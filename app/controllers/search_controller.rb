class SearchController < ApplicationController

  def index
    @users = User.where("username LIKE ?", "%#{params[:query]}%")
  end

end