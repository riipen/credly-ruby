# frozen_string_literal: true

module Credly
  module Actions
    module Badges
      def badges_get(params = {})
        connection.get("organizations/#{organization_id}/badges", params)
      end

      def badges_delete(badge_id)
        connection.delete("organizations/#{organization_id}/badges/#{badge_id}")
      end

      def badges_revoke(badge_id, params)
        connection.put("organizations/#{organization_id}/badges/#{badge_id}/revoke", params)
      end
    end
  end
end
