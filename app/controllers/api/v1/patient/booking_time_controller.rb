class Api::V1::Patient::BookingTimeController < PatientController
  include ScheduleTimeService
  def booking
    doctor = booking_doctor(@current_user, param_booking)

    render json: doctor, each_serializer: Api::V1::DoctorSerializer, status: :accepted
  end

  def index
    booking_times = @current_user.booking_times.order("date DESC")

    render json: booking_times, each_serializer: Api::V1::BookingTimeSerializer
  end

  private
    def param_booking
      params.permit(
        :doctor_uid,
        :date,
        :start_time,
        :end_time
      )
    end
end
