require 'rails_helper'

describe 'Examples' do
  it 'returns a list of example sentences' do
    # As a guest user (no sign in required)
    # When I visit "/"
    visit '/'
    # And I fill in a text box with "mindfulness"
    fill_in 'word', with: 'mindfulness'
    # And I click "Submit"
    click_on 'Submit'
    # Then I should see a message that says "Examples for using 'mindfulness'"
    expect(page).to have_content "Examples for using 'mindfulness'"
    
    within(first(".example")) do
      expect(page).to have_content("Meditation is one way to express mindfulness in a dedicated, concentrated manner.")
      # And I should see a list of sentences with examples of how to use the word
      # And I should see only sentences where the region for usage is "Brittish" or "Canadian"
      # And I should not see sentences for any other regions (or blank regions)
    end
  end
end