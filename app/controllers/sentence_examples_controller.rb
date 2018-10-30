class SentenceExamplesController < ApplicationController
  def index
    @facade = SentenceFacade.new(word_params[:word])
  end

  private
  def word_params
    params.permit(:word)
  end
end
