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
      password: 'password',
      password_confirmation: 'password',
      first_name: 'John',
      last_name: 'Doe'
    )
    expect(user).to_not be_valid
    expect(user.errors[:password_confirmation]).to include("Doesn't match Password")
  end
end

  describe '.authenticate_with_credentials' do
    it 'returns an instance of the user when successfully authenticated' do
      user = User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'password')
      expect(authenticated_user).to eq(user)
    end

    it 'returns nil when authentication fails' do
      user = User.create(
        email: 'test@example.com',
        password: 'password',
        password_confirmation: 'password',
        first_name: 'John',
        last_name: 'Doe'
      )
      authenticated_user = User.authenticate_with_credentials('test@example.com', 'wrong_password')
      expect(authenticated_user).to be_nil
    end
  end
end

