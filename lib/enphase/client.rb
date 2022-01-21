require 'faraday'
require 'faraday/net_http'
require 'faraday_middleware'
require 'json'

module Enphase
  class ClientError < StandardError; end
end

module Enphase
  class Client
    attr_reader :api_key, :user_id, :datetime_format

    # datetime format can be 'iso8601' or 'epoch', defaults to 'iso8601'
    def initialize(api_key:, user_id:, datetime_format: 'iso8601')
      @api_key = api_key
      @user_id = user_id
      @datetime_format = datetime_format
    end

    # Stats Endpoint
    def stats(system_id:, **params)
      get_json(url: "systems/#{system_id}/stats", params: params)
    end

    # Summary Endpoint
    def summary(system_id:, **params)
      get_json(url: "systems/#{system_id}/summary", params: params)
    end

    # Inverters Summary Endpoint
    def inverters(site_id:)
      get_json(url: 'systems/inverters_summary_by_envoy_or_site', params: {site_id: site_id})
    end

    # Index Endpoint
    def systems(**params)
      get_json(url: 'systems', params: params)
    end

    private
    def get_json(url:, params: {})
      conn = Faraday.new(
          url: "#{base_url}/#{url}",
          params: params.merge({key: api_key, user_id: user_id, datetime_format: datetime_format})
          ) do |f|
            f.request :json # encode req bodies as JSON and automatically set the Content-Type header
            f.response :json # decode response bodies as JSON
            f.adapter :net_http # adds the adapter to the connection
      end
      response = conn.get
      if response.success?
        response.body
      else
        raise Enphase::ClientError.new("API returned status #{response.status}: #{response.reason_phrase}")
      end
    end

    def base_url
      'https://api.enphaseenergy.com/api/v2'
    end
  end
end
