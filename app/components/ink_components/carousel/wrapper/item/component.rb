module InkComponents
  module Carousel
    module Wrapper
      module Item
        class Component < ApplicationComponent
          style do
            base { %w[ hidden ] }

            variants {
              transition {
                linear { %w[ linear ] }
                ease_out { %w[ ease-out ] }
                ease_in { %w[ ease-in ] }
                in_out { %w[ ease-in-out ] }
                initial { %w[ ease-in-out ] }
              }
              duration {
                duration_0 { %w[ duration-0 ] }
                duration_75 { %w[ duration-75 ] }
                duration_100 { %w[ duration-100 ] }
                duration_150 { %w[ duration-150 ] }
                duration_200 { %w[ duration-200 ] }
                duration_300 { %w[ duration-300 ] }
                duration_500 { %w[ duration-500 ] }
                duration_700 { %w[ duration-700 ] }
                duration_1000 { %w[ duration-1000 ] }
              }
            }

            defaults { { transition: :in_out, duration: :duration_700 } }
          end

          attr_reader :animation_duration, :animation_transition

          def initialize(animation_duration: :duration_700, animation_transition: :in_out, **extra_attributes)
            @animation_duration = animation_duration.to_sym
            @animation_transition = animation_transition.to_sym

            super(**extra_attributes)
          end

          private
          def default_attributes
            {
              class: style(transition: animation_transition, duration: animation_duration),
              data: { carousel_item: "" }
            }
          end
        end
      end
    end
  end
end
