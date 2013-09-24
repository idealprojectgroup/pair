require 'thor'
require 'pair/providers/digital_ocean'

module Pair
  class CLI < Thor

    check_unknown_options!

    desc "start", "Start a pair programming session."
    method_option "client-id", aliases: "-c", type: :string, default: false, desc: "Specify Client ID instead of using .pairrc"
    method_option "api-key",   aliases: "-t", type: :string, default: false, desc: "Specify API key instead of using .pairrc"
    def start
      Pair::Providers::DigitalOcean.new(self).start
    end
    default_task :start
  end
end
