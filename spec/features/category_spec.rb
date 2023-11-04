require 'rails_helper'

RSpec.feature 'Categories', type: :feature do
  before :each do
    @user = User.new(name: 'Sana', email: 'sanatameem@gmail.com', password: '111111')
    @category = Category.new(name: 'Foods', icon: 'food_icon.jpg', author: @user)
  end

  describe 'Categories index page' do
    it 'Should show the categories index page after the user is signed in' do
      visit root_path
      click_link 'SIGN UP'
      fill_in 'user[name]',	with: @user.name
      fill_in 'user[email]',	with: @user.email
      fill_in 'user[password]',	with: @user.password
      click_button 'Sign up'
      expect(page).to have_content('Categories')
      click_link 'ADD CATEGORY'
      fill_in 'category[name]',	with: @category.name
      fill_in 'category[icon]',	with: @category.icon
      click_button 'Create Category'
      expect(page).to have_content(@category.name)
      click_link @category.name
      expect(page).to have_content('Transactions')
    end
  end
end
