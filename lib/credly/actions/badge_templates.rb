# frozen_string_literal: true

module Credly
  module Actions
    module BadgeTemplates
      def badge_templates_get(params = {})
        connection.get("organizations/#{organization_id}/badge_templates", params)
      end

      def badge_templates_get_single(badge_template_id)
        connection.get("organizations/#{organization_id}/badge_templates/#{badge_template_id}")
      end
    end
  end
end
