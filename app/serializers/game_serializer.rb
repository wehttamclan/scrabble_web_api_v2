class GameSerializer < ActiveModel::Serializer
  attributes :game_id, :scores

  def game_id
    object.id
  end
  
  def scores
    [player_1_data, player_2_data]
  end

  def game
    Game.find(object.id)
  end

  def player_1_data
    {
      user_id: game.player_1.id,
      score: game.player_1.plays.sum(:score)
    }
  end

  def player_2_data
    {
      user_id: game.player_2.id,
      score: game.player_2.plays.sum(:score)
    }
  end
end
