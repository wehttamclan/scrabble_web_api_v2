require 'rails_helper'

describe 'stuff' do
  # As a guest user (no sign in required)
  # When I visit "/"
  visit '/'
  # And I fill in a text box with "mindfulness"
  fill_in 'text box', with: 'mindfulness'
  # And I click "Submit"
  click_on 'Submit'
  # Then I should see a message that says "Examples for using 'mindfulness'"
  within(first(".example")) do
    expect(current_page).to have_content "Examples for using 'mindfulness'"
    # And I should see a list of sentences with examples of how to use the word
    # And I should see only sentences where the region for usage is "Brittish" or "Canadian"
    # And I should not see sentences for any other regions (or blank regions)
  end
end