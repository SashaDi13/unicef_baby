module ControllerMacros
  def login_admin
    before(:each) do
      @request.env["devise.mapping"] = Devise.mappings[:admin]
      @admin = Admin.find_by(email: "exemple@dot.net")
      sign_in @admin
    end
  end
end
