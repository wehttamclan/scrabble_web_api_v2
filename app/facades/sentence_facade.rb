class SentenceFacade
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def examples

  end

  def service
    Faraday.get("https://od-api.oxforddictionaries.com/api/v1/entries/en/#{word}/sentences")
  end
end