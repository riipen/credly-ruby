# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::IssuerAuthorizations do
  subject { @client }

  before do
    @client = Credly::Client.new(auth_token: 'token')
    @organization_id = 1
  end

  describe '#issuer_list' do
    it 'issues the correct GET request' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/issuers")

      @client.issuer_list(@organization_id)

      expect(stub).to have_been_requested
    end
  end

  describe '#grantor_list' do
    it 'issues the correct GET request' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/grantors")

      @client.grantor_list(@organization_id)

      expect(stub).to have_been_requested
    end
  end

  describe '#issuer_deauthorize' do
    it 'issues the correct DELETE request' do
      issuer_id = 1
      stub = stub_request(:delete, "#{@client.url}/organizations/#{@organization_id}/issuers/#{issuer_id}")

      @client.issuer_deauthorize(@organization_id, issuer_id)

      expect(stub).to have_been_requested
    end
  end
end
