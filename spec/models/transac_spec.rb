require 'rails_helper'

RSpec.describe Transac, type: :model do
  it 'Should allow a transaction with name, amount and author' do
    user = User.create(name: 'Sana', email: 'sana@gmail.com', password: '111111')
    transac = Transac.create(name: 'Example Transaction', amount: 100.00, author: user)
    expect(transac).to be_valid
  end

  it 'Should not allow a transaction without name' do
    user = User.create(name: 'Sana', email: 'sana@gmail.com', password: '111111')
    transac = Transac.create(amount: 100.00, author: user)
    expect(transac).not_to be_valid
  end

  it 'Should not allow a transaction without amount' do
    user = User.create(name: 'Sana', email: 'sana@gmail.com', password: '111111')
    transac = Transac.create(name: 'Example Transaction', author: user)
    expect(transac).not_to be_valid
  end

  it 'Should not allow a transaction without author' do
    User.create(name: 'Sana', email: 'sana@gmail.com', password: '111111')
    transac = Transac.create(name: 'Example Transaction', amount: 100.00)
    expect(transac).not_to be_valid
  end
end
