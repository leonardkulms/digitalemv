# frozen_string_literal: true

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :slack, '626618029873.621538119554', '65a30e596ec2010eb3060a4ebb17095e', scope: 'identity.basic', team: 'TJEJ60VRP'
end
