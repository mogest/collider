require 'rails_helper'

RSpec.describe AtomSerializer do
  let(:atom)       { atoms(:write_tests) }
  let(:serializer) { AtomSerializer.new(atom) }

  it "serializes the atom and its live properties" do
    attribs = JSON.parse(serializer.to_json)
    properties = attribs.delete("properties")

    expect(attribs).to eq(
      "number"=>1,
      "element"=>"Story",
      "parent_atom_number"=>nil,
      "created_at"=>"2015-04-01T00:11:22.000Z"
    )

    expect(properties).to match_array [
      {
        "field_id"=>fields(:title).id,
        "field_name"=>"Title",
        "field_type"=>"long",
        "value"=>"Write some tests for Collider",
        "value_set_at"=>"2015-04-02T00:22:44.000Z"
      },
      {
        "field_id"=>fields(:priority).id,
        "field_name"=>"Priority",
        "field_type"=>"short",
        "value"=>nil,
        "value_set_at"=>nil
      },
      {
        "field_id"=>fields(:description).id,
        "field_name"=>"Description",
        "field_type"=>"textarea",
        "value"=>nil,
        "value_set_at"=>nil
      }
    ]
  end
end
