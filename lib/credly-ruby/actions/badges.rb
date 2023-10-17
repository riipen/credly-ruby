# frozen_string_literal: true

module Credly
  module Actions
    module Badges
      def badge_list(organization_id, query_params = {})
        connection.get("organizations/#{organization_id}/badges", query_params)
      end

      def badge_issue(organization_id, body_params)
        connection.post("organizations/#{organization_id}/badges", body_params)
      end

      def badge_delete(organization_id, badge_id)
        connection.delete("organizations/#{organization_id}/badges/#{badge_id}")
      end

      def badge_list_bulk(organization_id, query_params = {})
        connection.get("organizations/#{organization_id}/high_volume_issued_badge_search", query_params)
      end

      def badge_revoke(organization_id, badge_id, body_params)
        connection.put("organizations/#{organization_id}/badges/#{badge_id}/revoke", body_params)
      end

      def badge_replace(organization_id, badge_id, body_params)
        connection.post("organizations/#{organization_id}/badges/#{badge_id}/replace", body_params)
      end
    end
  end
end
