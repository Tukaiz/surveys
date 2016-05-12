module Surveys
  class Railtie < Rails::Railtie

    initializer "my_railtie.configure_rails_initialization" do |app|
      FeatureBase.register(app, Surveys)
    end

    config.after_initialize do
      FeatureBase.inject_feature_record("Surveys",
        "Surveys",
        "This will give the site the ability create Surveys."
      )
      FeatureBase.inject_permission_records(
        Surveys,
        SurveysFeatureDefinition.new.permissions
      )
    end

  end
end
