# frozen_string_literal: true

require 'alchemy_cms'
require 'devise'

module Alchemy
  module Devise
    class Engine < ::Rails::Engine
      isolate_namespace Alchemy
      engine_name 'alchemy_devise'

      initializer 'alchemy_devise.assets' do |app|
        app.config.assets.precompile += [
          'alchemy-devise.css'
        ]
      end

      config.to_prepare do
        require_relative '../../../app/controllers/alchemy/base_controller_extension.rb'
      end
    end
  end
end
