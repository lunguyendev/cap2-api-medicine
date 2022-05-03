class Api::V1::Doctor::PrescriptionController < DoctorController
  def create
    @current_user.prescriptions.create!(param_create)

    head :created
  end

  def index
    prescriptions = @current_user.prescriptions.order("created_at DESC")

    render json: prescriptions, each_serializer: Api::V1::PrescriptionSerializer
  end

  def show
    render json: targer_prescription, serializer: Api::V1::PrescriptionSerializer
  end

  def show_by_patient
    prescriptions = @current_user.prescriptions.where(patient_uid: params[:patient_uid]).order("created_at DESC")

    render json: prescriptions, each_serializer: Api::V1::PrescriptionSerializer
  end

  private
  def param_create
    params.permit(
      :patient_uid,
      :booking_time_uid,
      :note
    )
  end

  def targer_prescription
    @prescription ||= Prescription.find(params[:uid])
  end
end
