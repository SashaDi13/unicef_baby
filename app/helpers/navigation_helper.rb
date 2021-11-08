module NavigationHelper
  def active(url)
    'active' if current_page?(url)
  end
end
