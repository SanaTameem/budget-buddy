require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'Should allow a category with name, icon and author' do
    user = User.create(name: 'Sana', email: 'sana@gmail.com', password: '111111')
    category = Category.new(name: 'Example Category', icon: 'category-icon.jpg', author: user)
    expect(category).to be_valid
  end

  it 'Should not allow a category without name' do
    user = User.create(name: 'Sana', email: 'sana@gmail.com', password: '111111')
    category = Category.new(icon: 'category-icon.jpg', author: user)
    expect(category).not_to be_valid
  end

  it 'Should not allow a category without icon' do
    user = User.create(name: 'Sana', email: 'sana@gmail.com', password: '111111')
    category = Category.new(name: 'Example Category', author: user)
    expect(category).not_to be_valid
  end

  it 'Should not allow a category without author' do
    User.create(name: 'Sana', email: 'sana@gmail.com', password: '111111')
    category = Category.new(name: 'Example Category', icon: 'category-icon.jpg')
    expect(category).not_to be_valid
  end
end
