# frozen_string_literal: true

require "rails_helper"

RSpec.describe InkComponents::FormBuilder, type: :helper do
  before do
    unless defined?(User)
      User = Class.new do
        include ActiveModel::Model
        attr_accessor :name, :email, :bio, :avatar, :paid

        def self.model_name
          ActiveModel::Name.new(self, nil, "User")
        end
      end
    end
  end

  describe "#text_area" do
    context "when options are provided" do
      it "renders text_area component without errors" do
        object = User.new(name: "John Doe", email: "john@example.com")
        form_builder = described_class.new(:user, object, helper, {})

        expect {
          form_builder.text_area(:bio, rows: 5, placeholder: "Enter your bio")
        }.not_to raise_error
      end

      it "passes options correctly to text_area_component" do
        object = User.new(name: "John Doe", email: "john@example.com")
        form_builder = described_class.new(:user, object, helper, {})

        expect(form_builder).to receive(:text_area_component).with(
          hash_including(
            state: :default,
            name: "user[bio]",
            id: "user_bio",
            value: nil,
            rows: 5,
            placeholder: "Enter your bio"
          )
        )

        form_builder.text_area(:bio, rows: 5, placeholder: "Enter your bio")
      end

      it "does not raise undefined variable error for opts" do
        object = User.new(name: "John Doe", email: "john@example.com")
        form_builder = described_class.new(:user, object, helper, {})

        result = form_builder.text_area(:bio, rows: 3, class: "custom-class")

        expect(result).to be_present
      end
    end

    context "when object has errors" do
      it "sets state to :error" do
        object = User.new(name: "John Doe", email: "john@example.com")
        object.errors.add(:bio, "can't be blank")
        form_builder = described_class.new(:user, object, helper, {})

        expect(form_builder).to receive(:text_area_component).with(
          hash_including(state: :error)
        )

        form_builder.text_area(:bio)
      end
    end

    context "when object has no errors" do
      it "sets state to :default" do
        object = User.new(name: "John Doe", email: "john@example.com")
        form_builder = described_class.new(:user, object, helper, {})

        expect(form_builder).to receive(:text_area_component).with(
          hash_including(state: :default)
        )

        form_builder.text_area(:bio)
      end
    end
  end

  describe "#file_field" do
    it "sets multipart to true to enable multipart/form-data encoding" do
      object = User.new(name: "John Doe", email: "john@example.com")
      form_builder = described_class.new(:user, object, helper, {})

      expect(form_builder).to receive(:multipart=).with(true)

      form_builder.file_field(:avatar)
    end

    it "renders file_input_component" do
      object = User.new(name: "John Doe", email: "john@example.com")
      form_builder = described_class.new(:user, object, helper, {})

      allow(form_builder).to receive(:multipart=)

      expect(form_builder).to receive(:file_input_component).with(
        hash_including(
          name: "user[avatar]",
          id: "user_avatar"
        )
      )

      form_builder.file_field(:avatar)
    end

    it "passes additional options to file_input_component" do
      object = User.new(name: "John Doe", email: "john@example.com")
      form_builder = described_class.new(:user, object, helper, {})

      allow(form_builder).to receive(:multipart=)

      expect(form_builder).to receive(:file_input_component).with(
        hash_including(
          accept: "image/*",
          class: "custom-file-input"
        )
      )

      form_builder.file_field(:avatar, accept: "image/*", class: "custom-file-input")
    end

    it "adds enctype multipart/form-data to the form when used" do
      object = User.new(name: "John Doe", email: "john@example.com")

      result = helper.form_with(model: object, builder: InkComponents::FormBuilder) do |f|
        f.file_field(:avatar)
      end

      expect(result).to include('enctype="multipart/form-data"')
    end

    it "does not add enctype when only text fields are used" do
      object = User.new(name: "John Doe", email: "john@example.com")

      result = helper.form_with(model: object, builder: InkComponents::FormBuilder) do |f|
        f.text_field(:name)
        f.text_area(:bio)
      end

      expect(result).not_to include('enctype="multipart/form-data"')
    end
  end

  describe "#error_message" do
    context "when full option is true" do
      it "uses full error messages" do
        object = User.new(name: "John Doe", email: "invalid")
        object.errors.add(:email, "is invalid")
        form_builder = described_class.new(:user, object, helper, {})

        expect(form_builder).to receive(:helper_text_component).with(state: :error) do |**_opts, &block|
          expect(block.call).to eq("E-mail is invalid.")
        end

        form_builder.send(:error_message, :email, full: true)
      end

      it "uses full error messages multiple errors exist" do
        object = User.new(name: "John Doe", email: "invalid")
        object.errors.add(:email, "is invalid")
        object.errors.add(:email, "must be a valid email address")
        form_builder = described_class.new(:user, object, helper, {})

        expect(form_builder).to receive(:helper_text_component).with(state: :error) do |**_opts, &block|
          expect(block.call).to eq("E-mail is invalid and e-mail must be a valid email address.")
        end

        form_builder.send(:error_message, :email, full: true)
      end
    end

    context "when full option is false" do
      it "uses basic error messages when full: false" do
        object = User.new(name: "John Doe", email: "invalid")
        object.errors.add(:email, "is invalid")
        form_builder = described_class.new(:user, object, helper, {})

        expect(form_builder).to receive(:helper_text_component).with(state: :error) do |**_opts, &block|
          expect(block.call).to eq("Is invalid.")
        end

        form_builder.send(:error_message, :email, full: false)
      end

      it "capitalizes and formats basic error messages" do
        object = User.new(name: "John Doe", email: "invalid")
        object.errors.add(:email, "is invalid")
        form_builder = described_class.new(:user, object, helper, {})

        expect(form_builder).to receive(:helper_text_component).with(state: :error) do |**_opts, &block|
          expect(block.call).to eq("Is invalid.")
        end

        form_builder.send(:error_message, :email)
      end

      it "uses error messages multiple errors exist" do
        object = User.new(name: "John Doe", email: "invalid")
        object.errors.add(:email, "is invalid")
        object.errors.add(:email, "must be a valid email address")
        form_builder = described_class.new(:user, object, helper, {})

        expect(form_builder).to receive(:helper_text_component).with(state: :error) do |**_opts, &block|
          expect(block.call).to eq("Is invalid and must be a valid email address.")
        end

        form_builder.send(:error_message, :email)
      end
    end
  end
end
