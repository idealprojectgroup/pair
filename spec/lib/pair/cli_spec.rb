require 'spec_helper'

describe Pair::CLI do

  before do
    @cli = Pair::CLI.new
  end

  describe "#start" do
    it "designates to provider" do
      provider = stub
      Pair::Providers::DigitalOcean.should_receive(:new).with(@cli).and_return(provider)
      provider.should_receive(:start)
      @cli.start
    end
  end

end
