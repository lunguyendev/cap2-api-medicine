class Api::V1::Patient::PrescriptionController < PatientController
  def index
    prescriptions = @current_user.prescriptions.order("created_at DESC")

    render json: prescriptions, each_serializer: Api::V1::PrescriptionSerializer
  end

  def show
    render json: targer_prescription, serializer: Api::V1::PrescriptionSerializer
  end

  def show_by_booking
    prescriptions = @current_user.prescriptions.where(booking_time_uid: params[:booking_time_uid]).order("created_at DESC")

    render json: prescriptions, each_serializer: Api::V1::PrescriptionSerializer
  end

  private
  def targer_prescription
    @prescription ||= Prescription.find(params[:uid])
  end
end
