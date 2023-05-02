require 'rails_helper'

RSpec.describe 'Updating a review', type: :system do
  scenario 'valid inputs' do
    review = Review.create!(title: 'Review #1')
    visit edit_review_path(id: review.id)
    fill_in 'Title', with: 'Review #1'
    click_on 'Save review'
    visit reviews_path
    expect(page).to have_content('Review #1')
  end
end