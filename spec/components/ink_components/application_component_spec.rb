# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::ApplicationComponent, type: :component do
  describe "#initialize" do
    context "when merging attributes" do
      it "merges default and user attributes correctly" do
        default_attributes = { class: "bg-blue-500", id: "default-id" }
        allow_any_instance_of(described_class).to receive(:default_attributes).and_return(default_attributes)
        extra_attributes = { class: "text-white", id: "user-id", data: { controller: "example" } }
        component = described_class.new(**extra_attributes)

        expect(component.attributes[:id]).to eq("default-id user-id")
        expect(component.attributes[:data]).to eq(controller: "example")
      end

      it "concatenates class attributes" do
        default_attributes = { class: "bg-blue-500" }
        extra_attributes = { class: "text-white" } }
        
        allow_any_instance_of(described_class).to receive(:default_attributes).and_return(default_attributes)
       
        component = described_class.new(**extra_attributes)

        expect(component.attributes[:class]).to include("bg-blue-500 text-white")
      end
    end

    context "when classes with the same style are given" do
      it "merges Tailwind classes without conflits" do
        default_attributes = { class: "bg-blue-500 text-blue" }
        extra_attributes = { class: "bg-black-500 text-white" }
        
        allow_any_instance_of(described_class).to receive(:default_attributes).and_return(default_attributes)
        
        component = described_class.new(**extra_attributes)

        expect(component.attributes[:class]).to eq("bg-black-500 text-white")
      end
    end
  end
end
