require 'spec_helper'

feature "Editing Tasks -" do
  before do
    Factory(:task, :title => "knitting")
    visit "/"
    click_link "knitting"
    click_link "Edit Task"
  end    

  scenario "Updating a task" do
    fill_in "Title", :with => "magic loop knitting"
    click_button "Update Task"
    page.should have_content("Task was successfully updated")
  end

  scenario "Updating a task with invalid attributes is bad" do
    fill_in "Title", :with => ""
    click_button "Update Task"
    page.should have_content("Task was not updated.")
  end
end