# frozen_string_literal: true

module Credly
  class Client
    include Credly::Actions::Badges
    include Credly::Actions::BadgeTemplates
    include Credly::Actions::Organizations
    attr_reader :organization_id, :url
    attr_accessor :sandbox

    BASE_URL_P  = 'https://api.credly.com'
    BASE_URL_S  = 'https://sandbox-api.credly.com'

    def initialize(organization_id:, auth_token:, version: 'v1', sandbox: false)
      @base_url = sandbox ? BASE_URL_S : BASE_URL_P
      @url = [@base_url, version].join('/')
      @version = version
      @organization_id = organization_id
      @access_token = auth_token
      @sandbox = sandbox
    end

    def connection
      @connection ||= Connection.new(@url, @access_token)
    end

    def base_url
      @sandbox ? BASE_URL_S : BASE_URL_P
    end
  end
end
