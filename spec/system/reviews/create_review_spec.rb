require 'rails_helper'

RSpec.describe 'Creating a review', type: :system do
  before { @user = create(:user) }

  def log_in
    visit new_session_path
    fill_in 'Username', with: @user.username
    fill_in 'Password', with: @user.password
    find('#login').click
    expect(page).to have_content("Welcome #{@user.username}")
  end

  scenario 'valid review' do
    log_in
    visit new_session_path
    fill_in 'Username', with: @user.username
    fill_in 'Password', with: @user.password
    find('#login').click
    expect(page).to have_content("Welcome #{@user.username}")

    click_on 'Add a Review'
    fill_in 'Title', with: 'Review #1'
    fill_in 'Restaurant', with: 'Zaytoons'
    fill_in 'Address', with: 'London'
    fill_in 'Body', with: 'what an amazing restaurant'
    fill_in 'Score', with: '10'
    click_on 'Save review'
    visit root_path
    expect(page).to have_content('Review #1')
    click_on 'Review #1'
    expect(page).to have_content('Zaytoons')
    expect(page).not_to have_content('Ambiance:')
    expect(page).not_to have_content('Cuisine:')
    expect(page).not_to have_content('Price:')
  end

  scenario 'Ambiance, Cuisine, Price present' do
    review = create(:review)
    visit review_path(review)
    expect(page).to have_content(review.title)
    expect(page).to have_content("Ambiance: #{review.ambiance}")
    expect(page).to have_content("Price: #{review.price}")
    expect(page).to have_content("Cuisine: #{review.cuisine}")
  end

  # scenarion 'filter cuisine & price' do
  #   review = create(:review)
  #   visit review_path(review)
  #   expect(page).to have_content(review.title)
  # end

  scenario 'invalid inputs' do
    log_in
    visit new_review_path
    fill_in 'Title', with: ''
    fill_in 'Restaurant', with: ''
    fill_in 'Body', with: ''
    fill_in 'Score', with: '11'
    click_on 'Save review'
    expect(page).to have_content("Title can't be blank")
    expect(page).to have_content('Body is too short (minimum is 10 characters)')
    expect(page).to have_content('Score must be less than or equal to 10')
    expect(page).to have_content("Restaurant can't be blank")
    expect(page).to have_content("Address can't be blank")
  end
end
