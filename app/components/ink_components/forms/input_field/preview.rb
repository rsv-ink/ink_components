# frozen_string_literal: true

module InkComponents
  module Forms
    module InputField
      class Preview < Lookbook::Preview
        # @param size select { choices: [sm, md, lg] }
        # @param state select { choices: [default, success, error] }
        def playground(size: :md, state: :default)
          input_field_component(size:, state:, placeholder: "placeholder")
        end

        # @!group Sizes
        def small
          input_field_component(size: :sm, state: :default, placeholder: "Small")
        end

        def medium
          input_field_component(size: :md, state: :default, placeholder: "Medium")
        end

        def large
          input_field_component(size: :lg, state: :default, placeholder: "Large")
        end
        # @!endgroup

        # @!group States
        def default
          input_field_component(size: :md, state: :default, placeholder: "Default")
        end

        def success
          input_field_component(size: :md, state: :success, placeholder: "Success")
        end

        def error
          input_field_component(size: :md, state: :error, placeholder: "Error")
        end
        # @!endgroup

        # @!group Types
        def text
          input_field_component(size: :md, state: :default, placeholder: "Text")
        end

        def email
          input_field_component(size: :md, state: :default, placeholder: "Email", type: "email")
        end

        def password
          input_field_component(size: :md, state: :default, placeholder: "Password", type: "password")
        end

        def number
          input_field_component(size: :md, state: :default, placeholder: "Number", type: "number")
        end

        def phone_number
          input_field_component(size: :md, state: :default, placeholder: "(85) 98888-8888", type: "tel", pattern: "#{/\A(\(\d{2}\) \d{4}-\d{4})|(\(\d{2}\) 9{0,1}\d{4}-\d{4})\z/}")
        end

        def url
          input_field_component(size: :md, state: :default, placeholder: "Url", type: "url")
        end
        # @!endgroup
      end
    end
  end
end
