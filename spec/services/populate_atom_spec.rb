require 'rails_helper'

RSpec.describe PopulateAtom do
  let(:user)    { users(:test) }
  let(:element) { elements(:story) }

  context "when there is no pre-existing atom" do
    let(:data) do
      {
        "element_id" => element.id,
        "properties" => {
          fields(:title).id => "Awesome sauce",
          fields(:priority).id => 3,
          fields(:description).id => "This is an awesome sauce change."
        }
      }
    end

    it "creates a new atom" do
      populator = PopulateAtom.new(nil, data, user: user)

      result = populator.call
      expect(result).to be true

      expect(populator.atom).to be_persisted
      expect(populator.atom.number).to eq 2
      expect(populator.atom.element).to eq elements(:story)
      expect(populator.atom.created_by_user).to eq user

      prop = populator.atom.properties.live.structify
      expect(prop.title.text_value).to eq "Awesome sauce"
      expect(prop.priority.integer_value).to eq 3
      expect(prop.description.text_value).to include "change."
    end
  end

  context "when there is a pre-existing atom" do
    let(:atom) { element.atoms.create!(account: user.account, number: 2) }

    before do
      atom.properties.create!(field: fields(:title), value: "Awesome sauce")
    end

    let(:data) do
      {
        "properties" => {
          fields(:title).id => "Updated sauce",
          fields(:description).id => "This is an awesome sauce change."
        }
      }
    end

    it "updates the atom" do
      populator = PopulateAtom.new(atom, data, user: user)

      result = populator.call
      expect(result).to be true

      expect(populator.atom).to be_persisted
      expect(populator.atom.created_by_user).to be nil

      prop = populator.atom.properties.live.structify
      expect(prop.title.text_value).to eq "Updated sauce"
      expect(prop.description.text_value).to include "change."

      props = populator.atom.properties.where(field: fields(:title))
      expect(props.length).to eq 2
      expect(props.select(&:obsolete_at).length).to eq 1
    end
  end
end
