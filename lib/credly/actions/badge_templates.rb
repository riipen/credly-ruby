# frozen_string_literal: true

module Credly
  module Actions
    module BadgeTemplates
      def badge_templates_list(organization_id, query_params = {})
        connection.get("organizations/#{organization_id}/badge_templates", query_params)
      end

      def badge_template_get(organization_id, badge_template_id)
        connection.get("organizations/#{organization_id}/badge_templates/#{badge_template_id}")
      end
    end
  end
end
