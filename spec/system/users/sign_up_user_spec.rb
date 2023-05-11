require 'rails_helper'

RSpec.describe 'sign up a user', type: :system do
  scenario 'valid sign up' do
    visit new_session_path
    click_on 'Sign up'
    fill_in 'Username', with: 'paul'
    fill_in 'Email', with: 'paul@gmail.com'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    find('#sign_up').click
    expect(page).to have_content('Welcome paul')
  end
end
