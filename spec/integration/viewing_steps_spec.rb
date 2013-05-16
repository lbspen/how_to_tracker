require 'spec_helper'

feature "Viewing steps -" do
  before do
    crochet = Factory(:task, :title => "crochet")
    Factory(:step,
      :task => crochet,
      :summary => "Make it shiny!",
      :description => "Gradients! Starbursts! Oh my!")
    gardening = Factory(:task, :title => "gardening")
    Factory(:step,
      :task => gardening,
      :summary => "Standards compliance",
      :description => "Isn't a joke")

    visit "/"
  end

  scenario "Viewing steps for a given task -" do
    click_link "crochet"
    page.should have_content("Make it shiny!")
    page.should_not have_content("Standards compliance")

    click_link "Make it shiny!"
    within("#step h2") do
      page.should have_content("Make it shiny!")
    end
    page.should have_content("Gradients! Starbursts! Oh my!")
  end
end