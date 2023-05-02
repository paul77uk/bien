require 'rails_helper'

RSpec.describe 'Deleting a review', type: :system do
  scenario 'success' do
    review = Review.create!(title: 'Review #1')
    visit reviews_path
    expect(page).to have_content('Review #1')
    visit review_path(review)
    click_on 'Delete this review'
    accept_alert
    expect(page).not_to have_content('Review #1')
  end
end
