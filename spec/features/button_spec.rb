require 'rails_helper'

RSpec.describe 'Download buttons', type: :feature do
  scenario 'valid download app store' do
    visit root_path
    click_on "APP STORE", match: :first
    expect(page).to have_current_path("https://www.apple.com/")
    sleep(5)
  end

  scenario 'valid download google play' do
    visit root_path
    click_on "GOOGLE PLAY", match: :first
    expect(page).to have_current_path("https://play.google.com/store")
    sleep(5)
  end
end
