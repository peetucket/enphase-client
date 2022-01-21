require 'faraday'
require 'faraday/net_http'
require 'json'

module Enphase
  class Client
    attr_reader :api_key, :user_id

    def initialize(api_key:, user_id:)
      @api_key = api_key
      @user_id = user_id
    end

    # Stats Endpoint
    def stats(system_id:)
      get_json(url: "systems/#{system_id}/stats")
    end

    # Summary Endpoint
    def summary(system_id:)
      get_json(url: "systems/#{system_id}/summary")
    end

    # Inverters Summary Endpoint
    def inverters(site_id:)
      get_json(url: "systems/inverters_summary_by_envoy_or_site", params: {site_id: site_id})
    end

    private
    def get_json(url:, params: {})
      conn = Faraday.new(
          url: "#{base_url}/#{url}",
          params: params.merge({key: api_key, user_id: user_id})
          ) do |f|
            f.request :json # encode req bodies as JSON and automatically set the Content-Type header
            f.response :json # decode response bodies as JSON
            f.adapter :net_http # adds the adapter to the connection
      end
      response = conn.get
      response.body
    end

    def base_url
      'https://api.enphaseenergy.com/api/v2'
    end
  end
end
