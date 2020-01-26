require "rails_helper"

module Types
  describe QueryType do
    describe "#allProducts" do
      subject { described_class.fields["allProducts"] }

      specify do
        product_connection = GraphQL::Schema::NonNull.new(ProductType.connection_type)
        expect(subject.type).to eq(product_connection)
      end
    end
  end
end
