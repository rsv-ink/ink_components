# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::ApplicationComponent, type: :component do
  describe "#initialize" do
    context "when merging attributes" do
      it "merges default and user attributes correctly" do
        default_attributes = { class: "bg-blue-500", id: "default-id" }
        user_attributes = { class: "text-white", id: "user-id", data: { controller: "example" } }
        component = described_class.new(default_attributes: default_attributes, **user_attributes)

        expect(component.attributes[:id]).to eq("default-id user-id")
        expect(component.attributes[:data]).to eq(controller: "example")
      end

      it "concatenates class attributes" do
        default_attributes = { class: "bg-blue-500", id: "default-id" }
        user_attributes = { class: "text-white", id: "user-id", data: { controller: "example" } }
        component = described_class.new(default_attributes: default_attributes, **user_attributes)

        expect(component.attributes[:class]).to include("bg-blue-500")
        expect(component.attributes[:class]).to include("text-white")
      end
    end

    context "when processing Tailwind classes" do
      it "merges Tailwind classes correctly" do
        default_attributes = { class: "bg-blue-500 bg-red-500 mb-1 text-blue" }
        user_attributes = { class: "bg-black-500 text-white" }
        component = described_class.new(default_attributes: default_attributes, **user_attributes)

        expect(component.attributes[:class]).to eq("mb-1 bg-black-500 text-white")
      end
    end
  end
end
