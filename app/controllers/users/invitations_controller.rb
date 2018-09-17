class Users::InvitationsController < Devise::InvitationsController
  def new
    super
  end

  def create
    params[:user][:group_id] = current_inviter.group_id
    super
  end

  def edit
    super
  end

  def update
    super
  end

  def destroy
    super
  end



end