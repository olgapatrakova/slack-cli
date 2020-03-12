require 'pry'
require 'httparty'
Dotenv.load

module SlackCLI
  class Recipient
    attr_reader :slack_id, :name

    BASE_URL = "https://slack.com/api/"
    SLACK_TOKEN = ENV["SLACK_TOKEN"]

    def initialize(slack_id:, name:)
      @slack_id = slack_id
      @name = name
    end

    def send_message(message)
      # resp = HTTParty.post("#{BASE_URL}chat.postMessage",
      #   headers: {
      #     'Content-Type' => 'application/x-www-form-urlencoded'
      #   },
      #   body: {
      #     token: SLACK_TOKEN,
      #     channel: channel,
      #     text: message
      #   }
      # )
      # return resp.code == 200 && resp.parsed_response["ok"]
    end

    def self.get(url, params)
      response = HTTParty.get(url, params)
      return response 
    end

    def details
      raise NotImplementedError, 'Implement me in a child class!'
    end

    def self.list_all
      raise NotImplementedError, 'Implement me in a child class!'
    end
  end
end
