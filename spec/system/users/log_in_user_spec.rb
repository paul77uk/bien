require 'rails_helper'

RSpec.describe 'log in a user', type: :system do
  before { @user = create(:user) }

  scenario 'valid log in' do
    visit new_session_path
    fill_in 'Username', with: @user.username
    fill_in 'Password', with: @user.password
    find('#login').click
    expect(page).to have_content("Welcome #{@user.username}")
  end
end
