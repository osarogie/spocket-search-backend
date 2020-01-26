require "rails_helper"

module Products
  describe SearchProducts, type: :model do
    before(:all) { create_list(:product, 30) }
    let(:price) { Product.order("RANDOM()").first.price }
    let(:country) { Product.order("RANDOM()").first.country }

    context "country filter" do
      it "returns only products in specified countries" do
        products = Product.where('lower(country) = ?', country.downcase).to_a
        expect(SearchProducts.(filter: {country: [country]})).to contain_exactly(*products)
      end

      it "is case sensitive" do
        products = Product.where('lower(country) = ?', country.downcase).to_a
        expect(SearchProducts.(filter: {country: [country.downcase]})).to contain_exactly(*products)
      end
    end

    context "price filter" do
      it "returns products for max_price" do
        prices = SearchProducts.(filter: {max_price: price}).pluck(:price)
        expect(prices.any? { |pr| pr > price }).to eq(false)
      end

      it "returns products for min_price" do
        prices = SearchProducts.(filter: {min_price: price}).pluck(:price)
        expect(prices.any? { |pr| pr < price }).to eq(false)
      end
    end
  end
end
