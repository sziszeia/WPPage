require 'rails_helper'

RSpec.describe User, type: :model do
  context 'validation tests' do
    it 'ensures username presence' do
      user = User.new(password_digest: "password").save
      expect(user).to eq(false)
    end

    it 'ensures username length max 50' do
      user = User.new(userName: "111111111122222222223333333333444444444455555555556", password_digest: "password").save
      expect(user).to eq(false)
    end

    it 'ensures password presence' do
      user = User.new(userName: "bob").save
      expect(user).to eq(false)
    end

    it 'ensures password length min 8' do
      user = User.new(userName: "bob", password_digest: "hello").save
      expect(user).to eq(false)
    end

    it 'should save successfully' do
      user = User.new(userName: "bob", password_digest: "password").save
      expect(user).to eq(true)
    end

  end
end
