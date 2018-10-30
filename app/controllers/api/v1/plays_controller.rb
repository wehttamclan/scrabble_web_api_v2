class Api::V1::PlaysController < ApiBaseController
  def create
    play = Play.new(play_params)
    if play.save
      render json: {}, message: "201 Created Response", status: 201
    else
      render status: 404
    end
  end

  private
  def play_params
    params.permit(:game_id, :user_id, :word)
  end
end