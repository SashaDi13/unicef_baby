module CheckHelper
  def check(age, param)
    true if params[:search] && params[:search][param] && age.in?(params[:search][param])
  end

  def check_title
    if params[:search] && params[:search][:title]
      params[:search][:title]
    end
  end
end
