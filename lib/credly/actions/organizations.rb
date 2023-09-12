# frozen_string_literal: true

module Credly
  module Actions
    module Organizations
      def organizations_list
        connection.get('organizations')
      end

      def organization_get(id)
        connection.get("organizations/#{id}")
      end
    end
  end
end
