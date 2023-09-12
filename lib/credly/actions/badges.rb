# frozen_string_literal: true

module Credly
  module Actions
    module Badges
      def badge_list(params = {})
        connection.get("organizations/#{organization_id}/badges", params)
      end

      def badge_delete(badge_id)
        connection.delete("organizations/#{organization_id}/badges/#{badge_id}")
      end

      def badge_revoke(badge_id, revoke_params)
        connection.put("organizations/#{organization_id}/badges/#{badge_id}/revoke", revoke_params)
      end

      def badge_replace(badge_id, replace_params)
        connection.post("organizations/#{organization_id}/badges/#{badge_id}/replace", replace_params)
      end
    end
  end
end
