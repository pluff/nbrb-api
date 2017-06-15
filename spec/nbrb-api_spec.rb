#encoding: utf-8
require 'spec_helper'

describe Nbrb::Api do
  subject { Nbrb::Api }

  describe "currencies rates" do
    describe ".daily_rates" do
      let(:simple_response) { fixture('response/daily_rates_simple.xml') }
      let(:scaled_response) { fixture('response/daily_rates_scaled.xml') }

      it 'returns properly structured hash for each currency rate' do
        savon.expects(:ex_rates_daily).with(message: {on_date: Date.today}).returns(simple_response)
        #intentionally failing
        expect(subject.daily_rates).to eql({"AUD"=>{:cur_quot_name=>"1 австралийский доллар", :cur_scale=>"1", :cur_official_rate=>"42.42", :cur_code=>"036", :cur_abbreviation=>"AUD"}})
      end
    end
  end

  describe ".call" do
    it 'throws OperationNotFound exception on invalid call' do
      expect { subject.call(:asdasdads) }.to raise_exception Nbrb::Api::OperationNotFound
    end
    it 'delegates the call to soap client' do
      sample_operation = subject.client.operations.first
      expect(subject.client).to receive(:call).with(sample_operation, anything)
      subject.call(sample_operation)
    end
  end
end
