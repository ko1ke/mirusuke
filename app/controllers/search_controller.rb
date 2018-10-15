class SearchController < ApplicationController

  def index
    @users = current_user.group.users.where("username LIKE ?", "%#{params[:query]}%")
  end

end