require 'rails_helper'

RSpec.describe AtomsController, type: :controller do
  before do
    allow(controller).to receive(:google_auth_data).and_return(double(email: "test@example.com"))
  end

  describe "#index" do
    it "returns all atoms" do
      serializer = instance_double(AtomsSerializer, attributes: [1, 2])

      expect(AtomsSerializer).to receive(:new).and_return(serializer)
      get :index, format: "json"
      expect(JSON.parse(response.body)).to eq("atoms" => [1, 2])
    end
  end

  describe "#show" do
    it "returns an atom" do
      serializer = instance_double(AtomSerializer, attributes: {"a" => "b"})

      expect(AtomSerializer).to receive(:new).with(atoms(:write_tests)).and_return(serializer)
      get :show, id: 1, format: "json"
      expect(JSON.parse(response.body)).to eq("atom" => {"a" => "b"})
    end
  end

  describe "#create" do
    it "calls the PopulateAtom service"
  end

  describe "#update" do
    it "calls the PopulateAtom service"
  end
end
