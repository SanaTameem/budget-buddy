require 'rails_helper'

RSpec.describe User, type: :model do
  it 'Should allow a user with name, email and password' do
    user = User.new(name: 'Sana', email: 'sana@gmail.com', password: '111111')
    expect(user).to be_valid
  end

  it 'Should not allow a user without name' do
    user = User.new(email: 'sana@gmail.com', password: '111111')
    expect(user).not_to be_valid
  end

  it 'Should not allow a user without email' do
    user = User.new(name: 'Sana', password: '111111')
    expect(user).not_to be_valid
  end

  it 'Should not allow a user without password' do
    user = User.new(name: 'Sana', email: 'sana@gmail.com')
    expect(user).not_to be_valid
  end
end
