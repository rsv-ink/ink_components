# frozen_string_literal: true

module InkComponents
  class AttributeMerger
    def initialize(default_attributes:, user_attributes: {})
      @default_attributes = default_attributes
      @user_attributes = user_attributes
    end

    def merge
      merge_attributes(@default_attributes, @user_attributes)
    end

    private
    def merge_attributes(*args)
      args.each_with_object({}) do |object, result|
        result.merge!(object) do |_key, old, new|
          case new
          when Hash
            merge_hashes(old, new)
          when Array
            merge_arrays(old, new)
          when String
            merge_strings(old, new)
          else
            new
          end
        end
      end
    end

    def merge_hashes(old, new)
      old.is_a?(Hash) ? merge_attributes(old, new) : new
    end

    def merge_arrays(old, new)
      old.is_a?(Array) ? old + new : new
    end

    def merge_strings(old, new)
      old.is_a?(String) ? "#{old} #{new}" : new
    end
  end
end
