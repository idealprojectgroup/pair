require 'spec_helper'

describe Pair::CLI do

  before do
    @cli = Pair::CLI.new
  end

  describe "#start" do
    it "asks for their credentials" do
      @cli.should_receive(:ask).with("Client ID:")
      @cli.should_receive(:ask).with("API Key:")
      @cli.start
    end
  end

end
