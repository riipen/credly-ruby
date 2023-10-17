# frozen_string_literal: true

module Credly
  class Error < StandardError
    attr_reader :response

    def self.from_response(response) # rubocop:disable Metrics/CyclomaticComplexity, Metrics/MethodLength:
      klass =
        case response.status
        when 400 then BadRequest
        when 401 then Unauthorized
        when 403 then Forbidden
        when 404 then NotFound
        when 410 then Gone
        when 422 then UnprocessableEntity
        when 400..499 then ClientError
        when 500 then InternalServerError
        when 503 then ServiceUnavailable
        when 500..599 then ServerError
        end

      klass&.new(response)
    end

    def initialize(response = nil)
      @response = response

      super(build_error_message)
    end

    private

    def build_error_message
      return nil if @response.nil?

      @response.body
    end
  end

  class ClientError < Error; end
  class BadRequest < Error; end
  class Unauthorized < Error; end
  class Forbidden < Error; end
  class NotFound < Error; end
  class ServerError < Error; end
  class InternalServerError < Error; end
  class ServiceUnavailable < Error; end
  class UnprocessableEntity < Error; end
  class Gone < Error; end
end
