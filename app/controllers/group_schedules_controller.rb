class GroupSchedulesController < ApplicationController
  before_action :set_user, only: [:show]
  include Chart

  def index
    @schedules = Schedule.where(user_id: current_user.group.users).today
    gon.arr_for_chart = group_chart(@schedules)
  end

  def show
  end

  private

  def set_user
    @user = User.find(params[:id])
  end

end
