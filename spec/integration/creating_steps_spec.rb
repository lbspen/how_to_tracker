require 'spec_helper'

feature "Creating Steps -" do
  before do
    Factory(:task, :title => "cooking")
    visit "/"
    click_link "cooking"
    click_link "New Step"
  end

  scenario "creating a step" do
    fill_in "Number", :with => "1"
    fill_in "Summary", :with => "Wind yarn into a ball"
    fill_in "Description", :with => "Use a chair"
    click_button "Create Step"
    page.should have_content("Step has been created")
  end

  scenario "creating a step without valid attributes fails" do
    click_button "Create Step"
    page.should have_content("Step has not been created.")
    page.should have_content("Summary can't be blank")
    page.should have_content("Number can't be blank")
  end
end
 