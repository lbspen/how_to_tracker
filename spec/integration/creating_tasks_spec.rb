require 'spec_helper'

feature 'Creating Tasks -' do
  scenario "can create a task" do
    visit '/'
    click_link 'New Task'
    fill_in "Title", :with => "knitting"
    fill_in "Description", :with => "needles, yarn"
    click_button "Create Task"
    page.should have_content("Task was successfully created.")
  end

  scenario "can not create a task without a Title" do
    visit "/"
    click_link "New Task"
    click_button "Create Task"
    page.should have_content("Task was not created.")
    page.should have_content("Title can't be blank")
  end
end