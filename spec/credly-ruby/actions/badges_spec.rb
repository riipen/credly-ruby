# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::Badges do
  subject { @client }

  before do
    @client = Credly::Client.new(auth_token: 'token')
    @organization_id = 1
  end

  describe '#badge_list' do
    it 'issues the correct GET request with query params' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/badges")
             .with(query: { filter: 'query::FakePerson|state::pending', sort: '-issued_at', page: 2 })

      @client.badge_list(@organization_id, { filter: 'query::FakePerson|state::pending', sort: '-issued_at', page: 2 })

      expect(stub).to have_been_requested
    end
  end

  describe '#badge_issue' do
    it 'issues the correct POST request with body params' do
      body_params = {
        recipient_email: 'user1@example.com',
        badge_template_id: 'cfaf2910-ea5f-46f1-89a5-db525dad6e58',
        issued_at: '2014-04-01 09:41:00 -0500',
        issued_to_first_name: 'Earner First Name',
        issued_to_last_name: 'Earner Last Name',
        expires_at: nil,
        issuer_earner_id: 'abc123',
        locale: 'en',
        suppress_badge_notification_email: false
      }

      stub = stub_request(:post, "#{@client.url}/organizations/#{@organization_id}/badges")
             .with(body: body_params)

      @client.badge_issue(@organization_id, body_params)

      expect(stub).to have_been_requested
    end
  end

  describe '#badge_delete' do
    it 'issues the correct DELETE request' do
      badge_id = 0
      stub = stub_request(:delete, "#{@client.url}/organizations/#{@organization_id}/badges/#{badge_id}")

      @client.badge_delete(@organization_id, badge_id)

      expect(stub).to have_been_requested
    end
  end

  describe '#badge_revoke' do
    it 'issues the correct PUT request to revoke a badge with query params' do
      badge_id = 0
      reason = 'Check bounced'
      suppress_notification = false

      body_params = {
        reason: reason,
        suppress_revoke_notification_email: suppress_notification
      }

      stub = stub_request(:put, "#{@client.url}/organizations/#{@organization_id}/badges/#{badge_id}/revoke")
             .with(body: body_params)

      @client.badge_revoke(@organization_id, badge_id, body_params)

      expect(stub).to have_been_requested
    end
  end

  describe '#badge_replace' do
    it 'issues the correct POST request to replace a badge' do
      badge_id = 0

      body_params = {
        badge_template_id: '4008b9b1-1251-40a3-ba90-1bbc9720fc37',
        issued_at: '2014-04-01 09:41:00 -0500',
        issued_to: 'Firstname Lastname',
        issued_to_first_name: 'Firstname',
        issued_to_last_name: 'Lastname',
        issuer_earner_id: 'earner-1',
        expires_at: false,
        country_name: 'United States of America',
        state_or_province: 'Minnesota',
        evidence: [
          {
            type: 'UrlEvidence',
            value: 'http://www.example.com/evidence',
            description: 'Description in URL evidence is optional',
            name: 'Evidence'
          }
        ],
        notification_message: 'Lorem ipsum dolor'
      }

      stub = stub_request(:post, "#{@client.url}/organizations/#{@organization_id}/badges/#{badge_id}/replace")
             .with(body: body_params)

      @client.badge_replace(@organization_id, badge_id, body_params)

      expect(stub).to have_been_requested
    end
  end

  describe '#badges_get_bulk' do
    it 'issues the correct GET request without query params' do
      stub = stub_request(:get,
                          "#{@client.url}/organizations/#{@organization_id}/high_volume_issued_badge_search")

      @client.badge_list_bulk(@organization_id)

      expect(stub).to have_been_requested
    end

    it 'issues the correct GET request with query params' do
      stub = stub_request(:get,
                          "#{@client.url}/organizations/#{@organization_id}/high_volume_issued_badge_search")
             .with(query: { filter: 'query::FakePerson' })

      @client.badge_list_bulk(@organization_id, { filter: 'query::FakePerson' })

      expect(stub).to have_been_requested
    end
  end
end
