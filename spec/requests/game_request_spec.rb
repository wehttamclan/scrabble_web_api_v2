require 'rails_helper'

describe '/api/v1/games/id' do
  it 'sends data for a game' do
    user_1, user_2 = create_list(:user, 2)
    game_1 = create(:game, player_1: user_1, player_2: user_2)
    play_1 = create(:play, word: 'BBBBB', game: game_1, user: user_1)
    play_2 = create(:play, word: 'ABBBBB', game: game_1, user: user_2)

    get "/api/v1/games/#{game_1.id}"

    expect(response).to be_successful

    game = JSON.parse(response.body, symbolize_names: true)

    expect(game).to have_key(:game_id)
    expect(game).to have_key(:scores)
    expect(game[:scores].length).to eq 2
    expect(game[:scores].first).to have_key 'user_id'
    expect(game[:scores].first).to have_key 'score'
  end
end