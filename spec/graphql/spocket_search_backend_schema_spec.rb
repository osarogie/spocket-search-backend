require "rails_helper"

describe SpocketSearchBackendSchema do
  let(:context) { {} }
  let(:variables) { {} }
  let(:result) do
    SpocketSearchBackendSchema.execute(
        query_string,
        context: context,
        variables: variables
    )
  end

  describe "allProducts" do
    let(:query_string) do
      %(
        query {
          allProducts {
            edges {
              node {
                title
                description
                price
                country
              }
            }
          }
        }
      )
    end

    context "for an empty search" do
      it "returns a response" do
        expect(result["data"]["allProducts"]["edges"].is_a? Array).to eq(true)
      end
    end
  end
end
