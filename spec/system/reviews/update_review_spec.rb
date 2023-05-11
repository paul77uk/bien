require 'rails_helper'

RSpec.describe 'Updating a review', type: :system do
  before { @user = create(:user) }

  def log_in
    visit new_session_path
    fill_in 'Username', with: @user.username
    fill_in 'Password', with: @user.password
    find('#login').click
    expect(page).to have_content("Welcome #{@user.username}")
  end

  scenario 'valid inputs' do
    review = create(:review)
    my_review = Review.create(user: @user, title: 'Title', body: review.body, score: review.score, restaurant: review.restaurant, price: review.price, cuisine: review.cuisine, ambiance: review.ambiance, address: review.address)
    log_in
    visit edit_review_path(my_review)
    fill_in 'Title', with: 'Review #2'
    click_on 'Save review'
    visit reviews_path
    expect(page).to have_content('Review #2')
  end
end
