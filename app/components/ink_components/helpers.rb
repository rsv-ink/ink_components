# frozen_string_literal: true

module InkComponents::Helpers
  private

  def flat_query_params(params)
    Rack::Utils.parse_query(params.to_h.to_query).flat_map do |name, value|
      Array(value).map { |item| [ name, item ] }
    end
  end

  def mix(*args)
    args.each_with_object({}) do |object, result|
      result.merge!(object) do |_key, old, new|
        case [ old, new ].freeze
        in [Array, Array] | [Set, Set]
          old + new
        in [Array, Set]
          old + new.to_a
        in [Array, String]
          old + [ new ]
        in [Hash, Hash]
          mix(old, new)
        in [Set, Array]
          old.to_a + new
        in [Set, String]
          old.to_a + [ new ]
        in [String, Array]
          [ old ] + new
        in [String, Set]
          [ old ] + new.to_a
        in [String, String]
          "#{old} #{new}"
        in [_, Hash]
          { _: old, **new }
        in [Hash, _]
          { **old, _: new }
        in [_, nil]
          old
        else
          new
        end
      end
    end
  end
end
