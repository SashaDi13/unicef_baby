module FormHelper
  def article_title
    if current_page? new_article_path
      "Створити нову статтю"
    else
      "Редагувати статтю"
    end
  end

  def article_form_link_back(article)
    if article.new_record?
      link_to "Назад", articles_path, class: "btn-primary btn-lg form-btn-color form-br-color"
    else
      link_to "Скасувати редагування", category_article_path(article.category), class: "btn-primary btn-lg form-btn-color form-br-color"
    end
  end

  def article_form_action_text(article)
    if article.new_record?
      "Створити"
    else
      "Оновити"
    end
  end
end
