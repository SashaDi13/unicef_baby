# frozen_string_literal: true

class Admins::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    @admin = Admin.from_omniauth(request.env["omniauth.auth"])

    if @admin.persisted?
      sign_in_and_redirect @admin, event: :authentication
      set_flash_message(:notice, :success, kind: "Google")
    else
      session["devise.google_data"] = request.env["omniauth.auth"].except("extra")
      redirect_to new_admin_session_path
    end
  end

  def after_omniauth_failure_path_for
    redirect_to new_admin_session_path
  end
end
