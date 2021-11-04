require 'rails_helper'

RSpec.describe 'Article', type: :feature do
  scenario 'valid articles' do
    visit categories_path
    sleep(5)
    click_on "Здоров'я"
    expect(page).to have_current_path(category_path(5))
    expect(page).to have_content("Здоров'я")
    sleep(5)
    click_on "Читати більше", match: :first
    expect(find(:css, '.show-title')).to have_text("Як виробити режим сну у дитини")
    sleep(5)
  end
end
