require 'rails_helper'

describe "user can search for characters" do
  scenario "by house" do

    visit '/'

    select "Gryffindor", from: :house

    click_on 'Search For Members'

    expect(current_path).to eq(search_path)

    expect(page).to have_content("21 Members in house Gryffindor")
    within(".characters") do
      expect(page).to have_css(".name")
      expect(page).to have_content("Sirius Black")
      expect(page).to have_css(".role")
      expect(page).to have_css(".house")
      expect(page).to have_css(".patronus")
    end
  end
end
