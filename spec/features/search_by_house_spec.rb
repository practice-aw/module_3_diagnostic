require 'rails_helper'

describe "user can search for characters" do
  scenario "by house" do
    # As a user
    # When I visit "/"
    visit '/'
    # And I select "Colorado" from the dropdown
    select "Gryffindor", from: :house
    # And I click on "Locate Members of the House"
    click_on 'Search For Members'
    # Then my path should be "/search" with "state=CO" in the parameters
    expect(current_path).to eq(search_path)
    # And I should see a message "7 Results"
    expect(page).to have_content("21 Results")
    # And I should see a list of 7 the members of the house for Colorado
    # And I should see a name, role, party, and district for each member
    within(".characters") do
      expect(page).to have_css(".name")
      expect(page).to have_css(".role")
      expect(page).to have_css(".house")
      expect(page).to have_css(".patronus")
    end
    # And they should be ordered by seniority from most to least

  end
end
