require 'rails_helper'

feature 'User visits homepage' do
  scenario 'sees titles list' do
    visit root_path

    expect(page).to have_css 'div.titles-list'
  end
end
