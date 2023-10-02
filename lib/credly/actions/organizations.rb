# frozen_string_literal: true

module Credly
  module Actions
    module Organizations
      def organizations_list
        connection.get('organizations')
      end

      def organization_get(organization_id)
        connection.get("organizations/#{organization_id}")
      end

      def organization_update(organization_id, body_params)
        connection.put("organizations/#{organization_id}", body_params)
      end

      def organization_event_get(organization_id, event_id)
        connection.get("organizations/#{organization_id}/events/#{event_id}")
      end

      def organization_tokens_list(organization_id)
        connection.get("organizations/#{organization_id}/authorization_tokens")
      end

      def organization_event_list(organization_id, query_params = {})
        connection.get("organizations/#{organization_id}/events", query_params)
      end
    end
  end
end
