class Api::V1::Patient::ScheduleTimeController < PatientController
  include ScheduleTimeService
  def find_doctor
    doctor = find_booking(param_find_doctor)

    render json: doctor, each_serializer: Api::V1::DoctorSerializer
  end

  private
    def param_find_doctor
      params.permit(
        :date,
        :start_time,
        :end_time
      )
    end

    def target_schedule_time
      @target_schedule_time ||= ScheduleTime.find(params[:uid])
    end
end
