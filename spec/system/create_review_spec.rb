require 'rails_helper'

RSpec.describe 'Creating a review', type: :system do
  scenario 'valid inputs' do
    review = create(:review)
    visit new_review_path
    fill_in 'Title', with: review.title
    fill_in 'Body', with: review.body
    fill_in 'Score', with: review.score
    click_on 'Save review'
    visit root_path
    expect(page).to have_content(review.title)
  end

  scenario 'invalid inputs' do
    visit new_review_path
    fill_in 'Title', with: ''
    fill_in 'Body', with: ''
    fill_in 'Score', with: '11'
    click_on 'Save review'
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content('Body is too short (minimum is 10 characters)')
    expect(page).to have_content('Score must be less than or equal to 10')
  end
end
