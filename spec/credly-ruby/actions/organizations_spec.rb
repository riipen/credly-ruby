# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::Badges do
  subject { @client }

  before do
    @client = Credly::Client.new(auth_token: 'token')
    @organization_id = 1
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
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}")

      @client.organization_get(@organization_id)

      expect(stub).to have_been_requested
    end
  end

  describe '#organization_update' do
    it 'issues the correct PUT request' do
      update_params = {
        name: 'Example Organization',
        website_url: 'https://www.example.com',
        webhook_url: 'https://example.com/webhook_endpoint',
        location: 'East Junius, Ohio',
        zip_or_postal_code: '55437',
        contact_email: 'info@example.com',
        legal_contact_email: 'legal@example.com',
        organization_type: 'Auto Parts Reseller',
        bio: 'Since 1994',
        twitter_url: 'https://twitter.com/example',
        facebook_url: 'https://www.facebook.com/example',
        photo: 'https://cdn.example.com/path/to/image.png',
        city: 'Bloomington',
        state_or_province: 'Minnesota',
        country: 'United States',
        address: '1313 Mockingbird Lane',
        hide_subscription: false
      }

      stub = stub_request(:put, "#{@client.url}/organizations/#{@organization_id}").with(body: update_params)

      @client.organization_update(@organization_id, update_params)

      expect(stub).to have_been_requested
    end
  end

  describe '#organization_event_get' do
    it 'issues the correct GET request' do
      event_id = 2
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/events/#{event_id}")

      @client.organization_event_get(@organization_id, event_id)

      expect(stub).to have_been_requested
    end
  end

  describe '#organization_tokens_list' do
    it 'issues the correct GET request' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/authorization_tokens")

      @client.organization_tokens_list(@organization_id)

      expect(stub).to have_been_requested
    end
  end

  describe '#organization_event_list' do
    it 'issues the correct GET request without a page number' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/events")

      @client.organization_event_list(@organization_id)

      expect(stub).to have_been_requested
    end

    it 'issues the correct GET request with a page number' do
      page_number = 2

      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/events")
             .with(query: { page: page_number })

      @client.organization_event_list(@organization_id, { page: page_number })

      expect(stub).to have_been_requested
    end
  end
end
