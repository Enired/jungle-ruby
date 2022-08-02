require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    # it 'should not save without a password' do
    #   user = User.new(first_name: 'Jack', last_name: 'Frost', email: 'jf@jf.com')
    #   user.save
    #   p user.errors.full_messages
    #   expect(user.errors.full_messages).to include("Password can't be blank")
    # end

    it 'should save when all fields are filled out' do
      user = User.new(first_name: "Eugene", last_name: "Krabs", email: "money@money.com", password_digest: 'hello')
      user.save
      p user.errors.full_messages

    end

  end
end
