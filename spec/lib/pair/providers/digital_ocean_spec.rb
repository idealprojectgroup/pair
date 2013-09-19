require 'spec_helper'

describe Pair::Providers::DigitalOcean do
  let(:ui) { stub("ui", options: {} ) }

  before do
    @provider = Pair::Providers::DigitalOcean.new(ui)
  end

  describe "#start" do
    it "asks for credentials if api key not found" do
      ui.should_receive(:say).with("What are your Digital Ocean credentials?")
      ui.should_receive(:ask).with("Client ID:")
      ui.should_receive(:ask).with("API Key:")
      @provider.start
    end

    it "does not ask for credentials when api key is found" do
      ui.options["api-key"] = "abc123"
      ui.should_not_receive(:ask).with(any_args)
      @provider.start
    end
  end
end
