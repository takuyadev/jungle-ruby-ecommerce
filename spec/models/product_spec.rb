require "rails_helper"

RSpec.describe Product, type: :model do
  describe "Validations" do
    # Before each test, setup new category
    before :each do
      @category = Category.new
    end

    it "return true if validations pass" do
      @product = Product.create(name: "Name", price_cents: 10, quantity: 10, category: @category)
      expect(@product.persisted?).to eql(true)
    end

    it "return false if name is nil" do
      @product = Product.create(name: nil, price_cents: 10, quantity: 10, category: @category)
      expect(@product.persisted?).to eql(false)
    end

    it "return false if price is nil" do
      @product = Product.create(name: "Name", price_cents: nil, quantity: 10, category: @category)
      expect(@product.persisted?).to eql(false)
    end

    it "return false if quantity is nil" do
      @product = Product.create(name: "Name", price_cents: 10, quantity: nil, category: @category)
      expect(@product.persisted?).to eql(false)
    end

    it "return false if category is nil" do
      @product = Product.create(name: "Name", price_cents: 10, quantity: 10, category: nil)
      expect(@product.persisted?).to eql(false)
    end
  end
end
