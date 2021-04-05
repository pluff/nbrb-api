require "nbrb-api/version"
require "nbrb-api/currencies"
require "nbrb-api/exceptions"
require 'savon'

module Nbrb
  module Api
    WSDL = "https://www.nbrb.by/Services/ExRates.asmx?WSDL".freeze
    extend Currencies

    class << self
      attr_accessor :proxy
    end

    self.proxy = nil

    def self.call(operation, params = {})
      client.call(operation, params)
    rescue Savon::UnknownOperationError => e
      raise Nbrb::Api::OperationNotFound, "NBRB operation #{operation} was not found"
    end

    def self.client
      @client ||= if proxy
        Savon.client(wsdl: WSDL, log: false, proxy: proxy)
      else
        Savon.client(wsdl: WSDL, log: false)
      end
    end
  end
end
