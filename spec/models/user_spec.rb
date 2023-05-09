require "rails_helper"

RSpec.describe User, type: :model do
  context "returns true if" do
    it "passes all validations" do
      @user = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", password: "Password")
      expect(@user.valid?).to eql(true)
    end

    it "email has extra spaces" do
      @user = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", password: "Password")
      expect(@user.authenticate_with_credentials?(" test@test.com ", "Password")).not_to eql(nil)
    end

    it "email has inconsistent casing" do
      @user = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", password: "Password")
      expect(@user.authenticate_with_credentials?("Test@tEST.com", "Password")).not_to eql(nil)
    end
  end

  context "returns false if" do
    it "password is nil" do
      @user = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", password: nil)
      expect(@user.valid?).to eql(false)
    end

    it "password does not match with confirm" do
      @user = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", password: "password", password_confirmation: "passw0rd")
      expect(@user.valid?).to eql(false)
    end

    it "password is not longer than 6 characters" do
      @user = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", password: "123")
      expect(@user.valid?).to eql(false)
    end
    it "email is not unique" do
      @userOne = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", password: "password")
      @userTwo = User.create(first_name: "John", last_name: "Doe", email: "test@test.com", password: "password")
      expect(@userTwo.valid?).to eql(false)
    end
  end
end
