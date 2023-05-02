require 'rails_helper'

RSpec.describe 'Creating a review', type: :system do
  scenario 'valid inputs' do
    visit new_review_path
    fill_in 'Title', with: 'Review #1'
    click_on 'Save review'
    visit root_path
    expect(page).to have_content('Review #1')
  end
end
