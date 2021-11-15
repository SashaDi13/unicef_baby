require 'rails_helper'

RSpec.describe 'Navigation', type: :feature do
  scenario 'valid pages' do
    visit root_path
    sleep(5)
    click_on "Про нас"
    expect(page).to have_current_path(about_path)
    sleep(5)
    click_on "Поради"
    expect(page).to have_current_path(categories_path)
    sleep(5)
    click_on "Контакти"
    expect(page).to have_current_path(contact_path)
    sleep(5)
  end
end
