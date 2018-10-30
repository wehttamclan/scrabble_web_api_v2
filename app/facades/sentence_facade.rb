class SentenceFacade
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def examples
    byebug
  end

  def response
    conn.get("/api/v1/entries/en/#{word}/sentences")
  end

  def conn
    Faraday.new(url: "https://od-api.oxforddictionaries.com") do |faraday|
      faraday.headers['Content-Type'] = 'application/json'
      faraday.headers['app_id'] = ENV['oxford_app_id']
      faraday.headers['app_key'] = ENV['oxford_app_key']
      faraday.adapter  Faraday.default_adapter
    end
  end
end