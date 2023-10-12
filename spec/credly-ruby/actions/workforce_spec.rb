# frozen_string_literal: true

require 'spec_helper'

RSpec.describe Credly::Actions::Workforce do
  subject { @client }

  before do
    @client = Credly::Client.new(auth_token: 'token')
    @organization_id = 1
  end

  describe '#employee_list' do
    it 'issues the correct GET request without query params' do
      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/employees")

      @client.employee_list(@organization_id)

      expect(stub).to have_been_requested
    end

    it 'issues the correct GET request with query params' do
      query_params = {
        filter: 'state::accepted|names_or_email::johndoe@gmail.com',
        sort: 'email',
        page: 1
      }

      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/employees")
             .with(query: query_params)

      @client.employee_list(@organization_id, query_params)

      expect(stub).to have_been_requested
    end
  end

  describe '#employee_get' do
    it 'issues the correct GET request' do
      employee_id = 1

      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/employees/#{employee_id}")

      @client.employee_get(@organization_id, employee_id)

      expect(stub).to have_been_requested
    end
  end

  describe '#employee_create' do
    it 'issues the correct POST request' do
      body_params = {
        email: 'email1@example.com',
        first_name: 'Alfred',
        last_name: 'Skiles',
        team: 'Development',
        position_title: 'Front End',
        external_id: 'employee-external-id-123',
        manager_first_name: 'Jane',
        manager_last_name: 'Doe',
        manager_external_id: 'manager-external-id-123',
        country: 'United States of America',
        zip_code: '55347',
        state_or_province: 'Minnesota',
        department: 'Engineering',
        job_family: 'Human Resources'
      }

      stub = stub_request(:post, "#{@client.url}/organizations/#{@organization_id}/employees")
             .with(body: body_params)

      @client.employee_create(@organization_id, body_params)

      expect(stub).to have_been_requested
    end
  end

  describe '#employee_update' do
    it 'issues the correct PUT request' do
      employee_id = 1

      body_params = {
        first_name: 'Alfred',
        last_name: 'Persons',
        team: 'Development',
        position_title: 'Front End',
        external_id: 'employee-external-id-123',
        manager_first_name: 'Jane',
        manager_last_name: 'Doe',
        manager_external_id: 'manager-external-id-123',
        country: 'United States of America',
        zip_code: '55347',
        state_or_province: 'Minnesota',
        department: 'Engineering',
        organization_level1: 'Specialist',
        organization_level2: 'Director',
        organization_level3: 'Vice President',
        job_family: 'Human Resources'
      }

      stub = stub_request(:put, "#{@client.url}/organizations/#{@organization_id}/employees/#{employee_id}")
             .with(body: body_params)

      @client.employee_update(@organization_id, employee_id, body_params)

      expect(stub).to have_been_requested
    end
  end

  describe '#employee_invite' do
    it 'issues the correct POST request' do
      body_params = {
        employee_list: %w[external-id-1 external-id-2],
        list_type: 'external_id',
        statuses: ['pending']
      }

      stub = stub_request(:post, "#{@client.url}/organizations/#{@organization_id}/employees/send_invitations")
             .with(body: body_params)

      @client.employee_invite(@organization_id, body_params)

      expect(stub).to have_been_requested
    end
  end

  describe '#employee_delete' do
    it 'issues the correct DELETE request' do
      employee_id = 1

      stub = stub_request(:delete, "#{@client.url}/organizations/#{@organization_id}/employees/#{employee_id}")

      @client.employee_delete(@organization_id, employee_id)

      expect(stub).to have_been_requested
    end
  end

  describe '#employee_data_api_get' do
    it 'issues the correct GET request' do
      employee_id = 1

      stub = stub_request(:get, "#{@client.url}/organizations/#{@organization_id}/employees/#{employee_id}/data")

      @client.employee_data_api_get(@organization_id, employee_id)

      expect(stub).to have_been_requested
    end
  end
end
