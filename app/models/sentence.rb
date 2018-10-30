class Sentence
  def initialize(data)
    @region = data[:regions].first
    @text   = data[:text]
  end
end

