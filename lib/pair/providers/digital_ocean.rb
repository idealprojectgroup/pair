module Pair
  module Providers
    class DigitalOcean

      def initialize(ui)
        @ui = ui
      end

      def start
        unless api_token_available?
          ask_for_credentials && store_credentials
        end
      end

    private

      attr_reader :ui

      def api_token_available?
        ui.options["api-key"]
      end

      def ask_for_credentials
        ui.say "What are your Digital Ocean credentials?"
        @client_id = ui.ask("Client ID:")
        @api_key   = ui.ask("API Key:")
      end

      def store_credentials
        # Store api_key in a YAML file at ~/.pairrc
      end

      class << self

      end

    end
  end
end
