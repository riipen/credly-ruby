# frozen_string_literal: true

module Credly
  module Actions
    module IssuerAuthorizations
      def issuer_list(organization_id)
        connection.get("organizations/#{organization_id}/issuers")
      end

      def grantor_list(organization_id)
        connection.get("organizations/#{organization_id}/grantors")
      end

      def issuer_deauthorize(organization_id, issuer_id)
        connection.delete("organizations/#{organization_id}/issuers/#{issuer_id}")
      end
    end
  end
end
