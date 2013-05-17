require 'spec_helper'

feature "Viewing tasks -" do
  let!(:task) { Factory(:task, :title => "knitting") }
  let!(:step) { Factory(:step, 
    :number => 2, :task => task) }

  before do
    visit "/"  
    click_link "knitting"    
  end

  scenario "Listing all tasks" do
    page.current_url.should == task_url(task)
  end

  scenario "Listing steps in order" do  
    within("#steps td") do
      page.should have_content("2.")
    end
    click_link "New Step"
    fill_in "Number", :with => 1
    fill_in "Summary", :with => "find pattern"
    click_button "Create Step"
    click_link "Back"
    within("table") do
      page.body.should match /1\..*2\./m
    end
  end
end