require 'spec_helper'

feature "Viewing tasks -" do
  scenario "Listing all tasks" do
    task = Factory.create(:task, :title => "knitting")
    visit "/"
    click_link "knitting"
    page.current_url.should == task_url(task)
  end
end