require "singleton"

class BaseClient
  include Singleton

  RED_URI = "#{Settings.app_host}/auth/baseCRM/callback"

  #Requests oauth2 code
  def self.authorize(auth_params)
    OAuth2::Client.new(ENV['base_client_id'],
                       ENV['base_client_secret'],
                       site: "https://api.getbase.com",
                       authorize_url: "/oauth2/authorize?#{auth_params}"
                      )
  end
  #Obtains oauth2 token
  def self.obtain_token
    OAuth2::Client.new(ENV['base_client_id'],
                       ENV['base_client_secret'],
                       site: "https://api.getbase.com",
                       token_url: "/oauth2/token"
                      )
  end
end