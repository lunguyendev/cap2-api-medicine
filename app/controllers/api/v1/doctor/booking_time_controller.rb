class Api::V1::Doctor::BookingTimeController < DoctorController
  include ScheduleTimeService
  def index
    booking_times = @current_user.booking_times.order("date DESC")

    render json: booking_times, each_serializer: Api::V1::Patient::BookingTimeSerializer
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
