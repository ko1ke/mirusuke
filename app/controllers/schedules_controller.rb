class SchedulesController < ApplicationController
  before_action :set_schedule, only: [:destroy]

  # GET /schedules
  # GET /schedules.json
  def index
    @schedules = Schedule.where(user_id: current_user).ongoing
    gon.arr_for_chart = []

    @schedules.each_with_index do |schedule, index|
      order_num = (index + 1).to_s
      type = schedule.action_type_i18n
      start_time = js_time_str(schedule.start_time)
      termination_time = js_time_str(schedule.termination_time)
      gon.arr_for_chart << [order_num, type, start_time, termination_time]
    end
  end

  # GET /schedules/new
  def new
    @schedule = current_user.schedules.new
    @action_type = params[:action_type]
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
