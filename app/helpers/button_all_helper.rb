module ButtonAllHelper
  def big_btn_static_pages
    if current_page? about_path
      link_to "ПЕРЕЙТИ НА САЙТ ЮНІСЕФ", "https://www.google.com.ua/", class: "btn btn-primary btn-lg btn-all-art px-5 py-3 mt-5"
    else
      link_to "ПЕРЕГЛЯНУТИ ВСІ СТАТТІ", articles_path, class: "btn btn-primary btn-lg btn-all-art px-5 py-3 mt-5"
    end
  end

  def category_link(category)
    if session["search_#{category.id}"]
      session["search_#{category.id}"]
    else
      category_path(category)
    end
  end
end
