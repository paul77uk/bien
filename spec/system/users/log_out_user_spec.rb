require 'rails_helper'

RSpec.describe 'log out a user', type: :system do
  before { @user = create(:user) }

  def log_in
    visit new_session_path
    fill_in 'Username', with: @user.username
    fill_in 'Password', with: @user.password
    find('#login').click
    expect(page).to have_content("Welcome #{@user.username}")
  end

  scenario 'log out success' do
    visit new_session_path
    log_in
    click_on 'Log out'
    expect(page).not_to have_content("Welcome #{@user.username}")
    expect(page).to have_content('Sign up')
    expect(page).to have_content('Log in to Bien Reviews')
  end
end
