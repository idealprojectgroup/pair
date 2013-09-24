require 'pry'
require 'yaml'

module Pair
  module Providers
    class DigitalOcean

      NAME = "digital_ocean"

      def initialize(ui)
        @ui = ui
      end

      def start
        unless api_token_available?
          ask_for_credentials && store_credentials
        end
      end

    private

      DEFAULT_SETTINGS_LOCATION = "#{ENV['HOME']}/.pairrc"

      attr_reader :ui, :client_id, :api_key

      def api_token_available?
        credentials_from_options? || credentials_from_file?
      end

      def ask_for_credentials
        ui.say "What are your Digital Ocean credentials?"
        @client_id = ui.ask("Client ID:")
        @api_key   = ui.ask("API Key:")
      end

      def credential_keys
        [:client_id, :api_key]
      end

      def credentials_from_options
        ui.options["client-id"] && ui.options["api-key"]
      end
      alias_method :credentials_from_options?, :credentials_from_options

      def credentials_from_file
        @credentials_from_file ||= YAML::load_file(DEFAULT_SETTINGS_LOCATION)
      rescue
        false
      end
      alias_method :credentials_from_file?, :credentials_from_file

      def store_credentials
        # Store api_key in a YAML file at ~/.pairrc
        File.open(DEFAULT_SETTINGS_LOCATION, "w") do |file|
          file.write(updated_credentials_for_file.to_yaml)
        end
      end

      def credentials
        {
          client_id: client_id,
          api_key:   api_key,
        }
      end

      def updated_credentials_for_file
        (credentials_from_file || {}).merge("#{NAME}" => credentials)
      end

      class << self

      end

    end
  end
end
