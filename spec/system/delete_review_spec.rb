require 'rails_helper'

RSpec.describe 'Deleting a review', type: :system do
  scenario 'success' do
    review = create(:review)
    visit root_path
    expect(page).to have_content(review.title)
    visit review_path(review)
    click_on 'Delete this review'
    accept_alert
    visit root_path
    expect(page).not_to have_content(review.title)
  end
end
