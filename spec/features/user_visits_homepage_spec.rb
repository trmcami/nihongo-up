require 'rails_helper'

feature 'User visits homepage' do
  scenario 'sees media list' do
    visit root_path

    expect(page).to have_css 'div.media-list'
  end
end
