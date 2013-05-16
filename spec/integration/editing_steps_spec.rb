require 'spec_helper'

feature "Editing steps -" do
  let!(:task) { Factory(:task) }
  let!(:step) { Factory(:step, :task => task) }

  before do
    visit "/"
    click_link task.title
    click_link step.summary
    click_link "Edit Step"
  end

  scenario "Updating a step" do
    fill_in "Summary", :with => "Make it really shiny!"
    click_button "Update Step"
    page.should have_content "Step has been updated."
    within("#step h2") do
      page.should have_content("Make it really shiny!")
    end
    page.should_not have_content step.summary
  end

  scenario "Updating a step with invalid information" do
    fill_in "Summary", :with => ""
    click_button "Update Step"
    page.should have_content("Step was not updated.")
  end
end