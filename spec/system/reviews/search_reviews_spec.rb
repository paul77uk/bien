require 'rails_helper'

RSpec.describe 'Search reviews', type: :system do
  before { @review = create(:review) }

  scenario 'location search' do
    visit root_path
    fill_in 'Location...', with: @review.address
    expect(page).to have_content(@review.title)
  end

  scenario 'Cuisine search' do
    visit root_path
    fill_in 'Cuisine...', with: @review.cuisine
    expect(page).to have_content(@review.title)
  end

  scenario 'Price search' do
    visit root_path
    fill_in 'Price...', with: @review.price
    expect(page).to have_content(@review.title)
  end

  scenario 'full search' do
    visit root_path
    fill_in 'Location...', with: @review.address
    fill_in 'Cuisine...', with: @review.cuisine
    fill_in 'Price...', with: @review.price
    expect(page).to have_content(@review.title)
  end
end

