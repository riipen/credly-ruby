# frozen_string_literal: true

module Credly
  class Client
    include Credly::Actions::Badges
    include Credly::Actions::BadgeTemplates
    include Credly::Actions::Organizations
    include Credly::Actions::OBI
    attr_reader :url, :auth_token
    attr_accessor :sandbox

    BASE_URL_P  = 'https://api.credly.com'
    BASE_URL_S  = 'https://sandbox-api.credly.com'

    def initialize(auth_token:, version: 'v1', sandbox: false)
      @base_url = sandbox ? BASE_URL_S : BASE_URL_P
      @url = [@base_url, version].join('/')
      @version = version
      @auth_token = auth_token
      @sandbox = sandbox
      @connection = Connection.new(@url, @auth_token)
    end

    def connection
      @connection ||= Connection.new(@url, @auth_token)
    end

    def auth_token=(auth_token)
      @auth_token = auth_token
      @connection.auth_token = auth_token
    end

    def base_url
      @sandbox ? BASE_URL_S : BASE_URL_P
    end
  end
end
