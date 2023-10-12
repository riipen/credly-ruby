# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::BadgeTemplates do
  subject { @client }

  before do
    @client = Credly::Client.new(auth_token: 'token')
    @organization_id = 1
  end

  describe '#badge_templates_list' do
    it 'issues the correct request without query params' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/badge_templates")

      @client.badge_templates_list(@organization_id)

      expect(stub).to have_been_requested
    end

    describe '#badge_templates_list' do
      it 'issues the correct request with query params' do
        stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/badge_templates")
               .with(query: { filter: 'query::FakeParam' })

        @client.badge_templates_list(@organization_id, { filter: 'query::FakeParam' })

        expect(stub).to have_been_requested
      end
    end

    describe '#badge_template_get' do
      it 'issues the correct request with ID' do
        template_id = 1

        stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/badge_templates/#{template_id}")

        @client.badge_template_get(@organization_id, template_id)

        expect(stub).to have_been_requested
      end
    end
  end
end
