class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:edit, :destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.where(user_id: current_user.group.users)
                     .where('start_time < ? AND termination_time > ?', Date.today.end_of_day, DateTime.now)
                     .order(:termination_time)
    gon.arr_for_chart = []

    @schedules.each do |schedule|
      username = User.find(schedule.user_id).username
      type = schedule.action_type_i18n

      start_time = schedule.start_time < Date.today.beginning_of_day ?
                       js_time_str(Date.today.beginning_of_day) : js_time_str(schedule.start_time)
      termination_time = schedule.termination_time > Date.today.end_of_day ?
                             js_time_str(Date.today.end_of_day) : js_time_str(schedule.termination_time)
      gon.arr_for_chart << [username, type, start_time, termination_time]
    end
  end

  # GET /schedules/new
  def new
    @schedule = current_user.schedules.new
    @action_type = params[:action_type]
  end

  # GET /schedules/1/edit
  def edit
  end

  # POST /schedules
  # POST /schedules.json
  def create
    @schedule = current_user.schedules.new(schedule_params)

    respond_to do |format|
      if @schedule.save
        format.html {redirect_to root_url, notice: 'スケジュールが作成されました'}
        format.json {render :show, status: :created, location: @schedule}
      else
        @action_type = @schedule.action_type
        format.html {render :new}
        format.json {render json: @schedule.errors, status: :unprocessable_entity}
      end
    end
  end

  # DELETE /schedules/1
  # DELETE /schedules/1.json
  def destroy
    @schedule.destroy
    respond_to do |format|
      format.html {redirect_to root_url, notice: 'スケジュールが削除されました'}
      format.json {head :no_content}
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_schedule
    @schedule = Schedule.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def schedule_params
    params.require(:schedule).permit(:content, :action_type, :start_time, :termination_time)
  end

  def js_time_str(datetime_obj)
    datetime_obj.to_s.gsub(/\s?\+09:?00/, '').gsub(" ", 'T')
  end


end
