require 'rails_helper'

describe '/api/v1/games/:id/plays' do
  it 'sends POST for a play' do
    user_1, user_2 = create_list(:user, 2)
    game_1 = create(:game, player_1: user_1, player_2: user_2)
    play_1 = create(:play, word: 'BBBBB', game: game_1, user: user_1)
    play_2 = create(:play, word: 'ABBBBB', game: game_1, user: user_2)

    params = {
              user_id: user_1.id, 
              word: 'at'
              }

    post "/api/v1/games/#{game_1.id}/plays", params: params

    expect(response.status).to eq 201

    get "/api/v1/games/#{game_1.id}"


    game = JSON.parse(response.body, symbolize_names: true)

    expect(game[:scores].first[:score]).to eq 17
  end
end