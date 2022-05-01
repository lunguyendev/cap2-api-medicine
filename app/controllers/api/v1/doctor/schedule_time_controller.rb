class Api::V1::Doctor::ScheduleTimeController < DoctorController
  include ScheduleTimeService
  def create
    save_schedule_time(@current_user, param_create)

    head :created
  end

  def schedule_time_of_date
    schedules = ScheduleTime.schedule_time_of_date(@current_user, param_get_schedule[:date])

    render json: schedules, each_serializer: Api::V1::ScheduleTimeSerializer
  end

  def destroy
    destroy_schedule_time(@current_user, target_schedule_time)

    head :accepted
  end

  private
    def param_create
      params.permit(
        :date,
        :start_time,
        :end_time
      )
    end

    def param_get_schedule
      params.permit(
        :date
      )
    end

    def target_schedule_time
      @target_schedule_time ||= ScheduleTime.find(params[:uid])
    end
end
