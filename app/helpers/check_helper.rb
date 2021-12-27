module CheckHelper
  def check(age, param)
    if params[:search] && params[:search][param] && age.in?(params[:search][param])
      true
    else
      false
    end
  end

  def check_all(age, param)
    if params[:search] && param && params[:search][param].length < age.length
      false
    else
      true

    end
  end
end
