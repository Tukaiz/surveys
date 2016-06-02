require "surveys/version"

module Surveys
  # This will be executed in the ability class, by default, if the Feature is enabled.
  class Default
    def self.permissions
      []
    end
  end

  class SurveysFeatureDefinition
    include FeatureSystem::Provides
    def permissions
      [
        {
          can: true,
          callback_name: "can_manage_surveys",
          name: "Can Manage Surveys"
        }
      ]
    end
  end

  module Authorization
    module Permissions

      def can_manage_surveys
        can :manage, Survey
      end

    end
  end

end

require 'surveys/railtie' if defined?(Rails)
