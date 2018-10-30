class Api::V1::GamesController < ApiBaseController
  def show
    render json: Game.find(params[:id])
  end
end