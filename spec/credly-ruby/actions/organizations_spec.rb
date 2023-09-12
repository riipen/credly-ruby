# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::Badges do
  subject { @client }

  before do
    @client = Credly::Client.new(organization_id: 'id', auth_token: 'token')
  end

  describe '#organization_list' do
    it 'issues the correct GET request' do
      stub = stub_request(:get, "#{@client.url}/organizations")

      @client.organizations_list

      expect(stub).to have_been_requested
    end
  end

  describe '#organization_get' do
    it 'issues the correct GET request' do
      id = 1
      stub = stub_request(:get, "#{@client.url}/organizations/#{id}")

      @client.organization_get(id)

      expect(stub).to have_been_requested
    end
  end
end
