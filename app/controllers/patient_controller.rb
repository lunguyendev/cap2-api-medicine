class PatientController < ActionController::API
  include Errors::ExceptionHandler
  before_action :authorize_request

  private
    def authorize_request
      @current_user ||= Auth::Authorization.new(request.headers).execute

      return if (@current_user.patient? or @current_user.admin?) and @current_user.actived?

      raise Errors::ExceptionHandler::PermissionDenied, I18n.t("errors.permission_denied")
    end
end
