class SearchController < ApplicationController

  def index
    @users = current_user.group.users
                 .where("username LIKE ? or email LIKE ?",
                        "%#{params[:query]}%",
                        "%#{params[:query]}%")
  end

end