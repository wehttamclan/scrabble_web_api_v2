class SentenceFacade
  attr_reader :word

  def initialize(word)
    @word = word
  end

  def examples
    service.sentences.map do |sentence|
      Sentence.new(sentence) if ["British", "Canadian"].include?(sentence[:regions].first)
    end.compact
  end

  private
  def service
    @service ||= OxfordService.new(word)
  end
end