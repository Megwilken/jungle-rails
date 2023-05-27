require 'rails_helper'

RSpec.describe User, type: :model do
 describe 'Validations' do
  it 'is valid with valid attributes' do
    user = User.new(
      email: 'test@example.com',
      password: 'password',
      password_confirmation: 'password',
      first_name: 'John',
      last_name: 'Doe'
    )
    expect(user).to be_valid
  end

  it 'is not valid without a password' do
    user = User.new(
      email: 'test@example.com',
      password: nil,
      password_confirmation: 'password',
      first_name: 'John',
      last_name: 'Doe'
    )
    expect(user).to_not be_valid
    expect(user.errors.full_messages).to include("Password can't be blank")
  end

  it 'is not valid without a password confirmation' do
    user = User.new(
      email: 'test@example.com',
      password: 'short',
      password_confirmation: 'short',
      first_name: 'John',
      last_name: 'Doe'
    )
    expect(user).to_not be_valid
    expect(user.errors[:password]).to include("Password too short! must be at least 6 characters")
  end
end
end
