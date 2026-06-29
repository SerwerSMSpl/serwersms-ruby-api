require 'yaml'

module SerwerSMS
  class ClientFactory
    USERNAME_KEY = 'SERWERSMS_USERNAME'
    PASSWORD_KEY = 'SERWERSMS_PASSWORD'
    TOKEN_KEY    = 'SERWERSMS_TOKEN'
    API_URL_KEY  = 'SERWERSMS_API_URL'
    TIMEOUT_KEY  = 'SERWERSMS_TIMEOUT'

    # Tworzy klienta na podstawie zmiennych środowiskowych.
    #
    # Przykład:
    #   SerwerSMS::ClientFactory.from_env
    #
    def self.from_env
      opts = {}
      opts[:api_url] = ENV[API_URL_KEY]      if ENV[API_URL_KEY]
      opts[:timeout] = ENV[TIMEOUT_KEY].to_i if ENV[TIMEOUT_KEY]

      build_client(
        token:    ENV[TOKEN_KEY],
        username: ENV[USERNAME_KEY],
        password: ENV[PASSWORD_KEY],
        **opts
      )
    end

    # Tworzy klienta na podstawie pliku YAML.
    #
    # Przykład pliku config/serwersms.yml:
    #
    #   # Opcja 1 - autentykacja przez token (zalecana)
    #   serwersms_token: 'twoj_token'
    #
    #   # Opcja 2 - autentykacja przez login i hasło
    #   # serwersms_username: 'twoj_login'
    #   # serwersms_password: 'twoje_haslo'
    #
    #   # Opcjonalne
    #   # serwersms_api_url: 'https://api2.serwersms.pl'
    #   # serwersms_timeout: 30
    #
    # Przykład użycia:
    #   SerwerSMS::ClientFactory.from_yaml('config/serwersms.yml')
    #
    def self.from_yaml(yaml_file)
      raise SerwerSMS::Error, "Config file not found: #{yaml_file}" unless File.exist?(yaml_file)

      cfg = YAML.safe_load_file(yaml_file) || {}

      opts = {}
      opts[:api_url] = cfg['serwersms_api_url'] if cfg['serwersms_api_url']
      opts[:timeout] = cfg['serwersms_timeout'] if cfg['serwersms_timeout']

      build_client(
        token:    cfg['serwersms_token'],
        username: cfg['serwersms_username'],
        password: cfg['serwersms_password'],
        **opts
      )
    end

    private

    def self.build_client(token:, username:, password:, **opts)
      if !token.to_s.strip.empty?
        ClientToken.new(token: token, **opts)
      elsif !username.to_s.strip.empty? && !password.to_s.strip.empty?
        ClientCredentials.new(username: username, password: password, **opts)
      else
        raise SerwerSMS::Error, 'Wymagany SERWERSMS_TOKEN lub para SERWERSMS_USERNAME + SERWERSMS_PASSWORD'
      end
    end
  end
end
