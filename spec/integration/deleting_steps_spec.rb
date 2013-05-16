require 'spec_helper'

feature "Deleting tickets -" do
  let!(:task) { Factory(:task) }
  let!(:step) { Factory(:step, :task => task) }

  before do
    visit "/"
    click_link task.title
    click_link step.summary
  end

  scenario "Deleting a step" do
    click_link "Delete Step"
    page.should have_content("Step has been deleted.")
    page.current_url.should == task_url(task)
  end
end