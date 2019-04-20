# frozen_string_literal: true

class FlipperFlag
  FEATURES = %i[
    example_flipper_feature_1
    example_flipper_feature_2
  ]

  class << self
    def client
      Flipper
    end

    FEATURES.each do |feature_name|
      define_method("#{feature_name}_enabled?") do |actor = nil|
              client[feature_name].enabled?(actor)
      end

      define_method("#{feature_name}_disabled?") do |actor = nil|
        !client[feature_name].disabled?(actor)
      end
    end

    def all(*actors)
      FEATURES.inject({}) do |enabled_features, feature_name|
        result = client[feature_name].enabled?
        result ||= actors.any? { |actor| client[feature_name].enabled?(actor) }
        enabled_features.merge(feature_name => result)
      end
    end
  end
end
