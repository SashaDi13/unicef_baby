module ButtonAllHelper
  def btn_all
    if current_page? about_path
      link_to "ПЕРЕЙТИ НА САЙТ ЮНІСЕФ", "https://www.google.com.ua/", class: "btn btn-primary btn-lg btn-all-art px-5 py-3 mt-5"
    else
      link_to "ПЕРЕГЛЯНУТИ ВСІ СТАТТІ", articles_path, class: "btn btn-primary btn-lg btn-all-art px-5 py-3 mt-5"
    end
  end

  def form_link_back(article)
    if current_page? new_article_path
      text =" Створити"
      link_to "Назад", articles_path, class: "btn-primary btn-lg form-btn-color form-br-color"
    else
      text = "Оновити"
      link_to "Скасувати редагування", category_article_path(article.category), class: "btn-primary btn-lg form-btn-color form-br-color"
    end
  end

  def text_change
    if current_page? new_article_path
      " Створити"
    else
      "Оновити"
    end
  end

end
