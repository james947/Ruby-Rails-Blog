require 'rails_helper'

feature 'homepage' do
  scenario 'coming soon' do
    visit('/')
    expect(page).to have_content('Coming Soon')
  end
end
