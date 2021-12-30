module CheckHelper
  def check_filter_value?(value, param)
    params[:search] && params[:search][param] && value.in?(params[:search][param])
  end
end
