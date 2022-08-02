require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    it 'should not save without a password' do
      user = User.new(first_name: 'Jack', last_name: 'Frost', email: 'jf@jf.com')
      user.save
      expect(user.errors.full_messages).to include("Password can't be blank")
    end

    it 'should not save when the password and password confirmation are not the same' do
      user = User.new(first_name: "Eugene", last_name: "Krabs", email: "money@money.com", password: 'hello', password_confirmation: 'jesus')
      user.save
      expect(user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    
    it 'should not save when the password length is less than 4' do
      user = User.new(first_name: "Eugene", last_name: "Krabs", email: "money1@money1.com", password: 'hi', password_confirmation: 'hi')
      user.save
      expect(user.errors.full_messages).to include("Password is too short (minimum is 4 characters)")
    end
    
    it 'should not save when the email has already been used to register' do
      user1 = User.new(first_name: "Eugene", last_name: "Krabs", email: "money1@money1.com", password: 'hello', password_confirmation: 'hello')
      user2 = User.new(first_name: "Eugene", last_name: "Krabs", email: "money1@money1.com", password: 'hello', password_confirmation: 'hello')
      user1.save
      user2.save
      expect(user2.errors.full_messages).to include("Email has already been taken")
    end
    
    it 'should not save without a first name' do
      user = User.new(last_name: "Krabs", email: "money@money.com", password: 'hello', password_confirmation: 'hello')
      user.save
      expect(user.errors.full_messages).to include("First name can't be blank")
    end

    it 'should not save without a last name' do
      user = User.new(first_name: "Krabs", email: "money@money.com", password: 'hello', password_confirmation: 'hello')
      user.save
      expect(user.errors.full_messages).to include("Last name can't be blank")
    end
  end

  describe '.authenticate_with_credentials' do
    it 'should return nil if the user is not authenticated because of a wrong password' do
      user = User.new(first_name: "Eugene", last_name: "Krabs", email: "money@money.com", password: 'hello', password_confirmation: 'hello')
      user.save
      expect(user.authenticate_with_credentials('money@money.com', 'sssss')).to eq(nil)
    end
    
    it 'should return nil if the user is not authenticated because of incorrect email' do
      user = User.new(first_name: "Eugene", last_name: "Krabs", email: "money@money.com", password: 'hello', password_confirmation: 'hello')
      user.save
      expect(user.authenticate_with_credentials('money1@money.com', 'hello')).to eq(nil)
    end
  end

end
