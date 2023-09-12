# frozen_string_literal: true

module Credly
  module Actions
    module BadgeTemplates
      def badge_templates_list(params = {})
        connection.get("organizations/#{organization_id}/badge_templates", params)
      end

      def badge_template_get(badge_template_id)
        connection.get("organizations/#{organization_id}/badge_templates/#{badge_template_id}")
      end
    end
  end
end
