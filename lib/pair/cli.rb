require 'thor'

module Pair
  class CLI < Thor

    check_unknown_options!

    desc "start", "Start a pair programming session."
    def start
      say "What are your Digital Ocean credentials?"
      client_id = ask("Client ID:")
      api_key   = ask("API Key:")
    end
    default_task :start
  end
end
