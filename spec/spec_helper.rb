#encoding: utf-8
require 'rspec'
require 'webmock/rspec'
require 'nbrb-api'
require "savon/mock/spec_helper"


def fixture(fixture_path)
  File.read("spec/fixtures/#{fixture_path}")
end

RSpec.configure do |c|
  c.include Savon::SpecHelper
  c.before :all do
    savon.mock!
  end
  c.after :all do
    savon.unmock!
  end

  c.before :each do
    WebMock.stub_request(:get, Nbrb::Api::WSDL).
        to_return(status: 200, headers: {}, body: fixture('wsdl.xml'))
  end
end

WebMock.disable_net_connect!(allow_localhost: true)
