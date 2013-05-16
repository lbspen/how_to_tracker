require 'spec_helper'

feature "Deleting Tasks -" do
  scenario "Deleting a task" do
    Factory(:task, :title => "knitting")
    visit "/"
    click_link "knitting"
    click_link "Delete Task"
    page.should have_content("Task has been deleted.")

    visit "/"
    page.should_not have_content("knitting")
  end
end