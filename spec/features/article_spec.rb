require 'rails_helper'

RSpec.describe 'Article', type: :feature do
  scenario 'valid articles' do
    visit categories_path
    sleep(5)
    click_on "Перший досвід"
    expect(page).to have_current_path(category_path(1))
    expect(page).to have_content("Перший досвід")
    sleep(5)
    click_on "Читати більше", match: :first
    expect(find(:css, '.show-title')).to have_text("10 причин чому ваша дитина погано спить")
    sleep(5)
  end

  # scenario 'create article if admin' do
  #   visit new_admin_session_path
  #   fill_in "Email", with: "exemple@dot.net"
  #   fill_in "Password", with: "123456"
  #   click_button 'Log in'
  #   visit new_article_path
  #   sleep(5)
  #   fill_in "Title", with: "New Article"
  #   fill_in "Description", with: "Creating a new Article"
  #   click_on "Create Article"
  #   expect(page).to have_content 'Article create succesfully!'
  #   sleep(5)
  # end
end
