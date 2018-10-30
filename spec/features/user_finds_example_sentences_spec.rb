require 'rails_helper'

describe 'Examples' do
  it 'returns a list of example sentences' do
    visit '/'

    fill_in 'word', with: 'mindfulness'

    click_on 'Submit'

    expect(page).to have_content "Examples for using 'mindfulness'"

    within(first(".example")) do
      expect(page).to have_content("Meditation is one way to express mindfulness in a dedicated, concentrated manner.")
      expect(page).to_not have_content("So mindfulness of drinking is already one kind of enlightenment.")
    end
  end
end