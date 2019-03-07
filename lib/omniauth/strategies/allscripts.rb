require 'omniauth-oauth2'

module OmniAuth
  module Strategies
    class AllScripts < OmniAuth::Strategies::OAuth2
      option :name, 'allscripts'

      option :client_options, {
        :site => 'https://pro171.open.allscripts.com',
        :authorize_url => 'https://pro171.open.allscripts.com/authorization/connect/authorize',
        :token_url => 'https://pro171.open.allscripts.com/authorization/connect/token'
      }

      option :scope, 'launch openid'

      uid do
        SecureRandom.hex(8) # Users endpoint for AllScripts does not exist or is not publically documented. Generate a random UID
      end

      info do
        access_token
      end

      def callback_url
        full_host + script_name + callback_path
      end

      alias :oauth2_access_token :access_token

      def access_token
        ::OAuth2::AccessToken.new(client, oauth2_access_token.token, {
          :expires_in => oauth2_access_token.expires_in,
          :expires_at => oauth2_access_token.expires_at
        })
      end

    end
  end
end

OmniAuth.config.add_camelization 'allscripts', 'AllScripts'
