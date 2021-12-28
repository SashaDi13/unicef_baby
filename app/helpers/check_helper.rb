module CheckHelper
  def check(age, param)
    params[:search] && params[:search][param] && age.in?(params[:search][param])
  end

  def check_title
    params[:search]["title"] if params[:search]
  end
end
