class Api::V1::Patient::ScheduleTimeController < PatientController
  include ScheduleTimeService
  def find_doctor
    doctor = find_booking(param_find_doctor)

    render json: doctor, each_serializer: Api::V1::DoctorSerializer
  end

  def available_time
    times = available_time_of_date(target_doctor, param_available_time[:date])

    render json: {available_time: times}
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

    def param_available_time
      params.permit(
        :date,
        :doctor_uid
      )
    end

    def target_doctor
      @doctor ||= Doctor.find(param_available_time[:doctor_uid])
    end
end
