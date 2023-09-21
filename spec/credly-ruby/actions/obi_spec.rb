# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::OBI do
  subject { @client }

  before do
    @client = Credly::Client.new(auth_token: 'token')
  end

  describe '#obi_badge_assertion_get' do
    it 'issues the correct GET request' do
      badge_id = 1
      stub = stub_request(:get, "#{@client.url}/obi/v2/badge_assertions/#{badge_id}")

      @client.obi_badge_assertion_get(badge_id)

      expect(stub).to have_been_requested
    end
  end

  describe '#obi_badge_class_get' do
    it 'issues the correct GET request' do
      badge_class_id = 1
      stub = stub_request(:get, "#{@client.url}/obi/v2/badge_classes/#{badge_class_id}")

      @client.obi_badge_class_get(badge_class_id)

      expect(stub).to have_been_requested
    end
  end

  describe '#obi_issuer_get' do
    it 'issues the correct GET request' do
      issuer_id = 1
      stub = stub_request(:get, "#{@client.url}/obi/v2/issuers/#{issuer_id}")

      @client.obi_issuer_get(issuer_id)

      expect(stub).to have_been_requested
    end
  end
end
