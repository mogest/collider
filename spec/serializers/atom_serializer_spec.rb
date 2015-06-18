require 'rails_helper'

RSpec.describe AtomSerializer do
  let(:atom)       { atoms(:write_tests) }
  let(:serializer) { AtomSerializer.new(atom) }

  it "serializes the atom and its live properties" do
    attribs = JSON.parse(serializer.to_json)
    expect(attribs).to eq(
      "atom" => {
        "element"=>"Story",
        "parent_atom_number"=>nil,
        "properties" => [
          {
            "field_id"=>fields(:title).id,
            "field_name"=>"Title",
            "field_type"=>"long",
            "value"=>"Write some tests for Collider",
            "created_at"=>"2015-04-02T00:22:44.000Z"
          }
        ],
        "created_at"=>"2015-04-01T00:11:22.000Z"
      }
    )
  end
end
