class Sentence
  attr_reader :text
  
  def initialize(data)
    @region = data[:regions].first
    @text   = data[:text]
  end
end

