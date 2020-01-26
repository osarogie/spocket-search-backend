require "rails_helper"

describe Product, type: :model do
  it "has a valid factory" do
    expect(build(:product)).to be_valid
  end

  it "is not valid without a title" do
    expect(build(:product, :no_title)).to_not be_valid
  end

  it "is not valid without a country" do
    expect(build(:product, :no_country)).to_not be_valid
  end

  context "price" do
    it 'cannot be negative' do
      expect { create(:product, :negative_price) }.to raise_error(ActiveRecord::RecordInvalid)
    end
  end
end
