require 'rails_helper'

RSpec.describe 'Creating a signed in comment', type: :system do
  before { @user = create(:user) }

  def log_in
    visit new_session_path
    fill_in 'Username', with: @user.username
    fill_in 'Password', with: @user.password
    find('#login').click
    expect(page).to have_content("Welcome #{@user.username}")
  end

  scenario 'comment exists' do
    review = create(:review)
    log_in
    visit root_path
    click_on review.title
    expect(page).to have_content(review.title)
    fill_in 'Body', with: "That's a great review. I agree it was a a great restaurant with amazing food"
    click_on 'Add Comment'
    expect(page).to have_content("That's a great review.")
    visit root_path
    expect(page).to have_content('1 comment')
  end

  scenario 'profane comment exists' do
    review = create(:review)
    log_in
    visit root_path
    click_on review.title
    expect(page).to have_content(review.title)
    fill_in 'Body', with: 'Fuck'
    click_on 'Add Comment'
    expect(page).to have_content('@#$%')
    visit root_path
    expect(page).to have_content('1 comment')
  end
end
