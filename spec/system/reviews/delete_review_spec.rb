require 'rails_helper'

RSpec.describe 'Deleting a review', type: :system do
  before { @user = create(:user) }

  def log_in
    visit new_session_path
    fill_in 'Username', with: @user.username
    fill_in 'Password', with: @user.password
    find('#login').click
    expect(page).to have_content("Welcome #{@user.username}")
  end

  scenario 'success' do
    review = create(:review)
    my_review = Review.create(user: @user, title: 'Title', body: review.body, score: review.score, restaurant: review.restaurant, price: review.price, cuisine: review.cuisine, ambiance: review.ambiance, address: review.address)
    log_in
    visit root_path
    expect(page).to have_content(my_review.title)
    visit review_path(my_review)
    click_on 'Delete this review'
    accept_alert
    visit root_path
    expect(page).not_to have_content(my_review.title)
  end
end
