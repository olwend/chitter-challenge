require 'spec_helper'

feature 'peeps display' do
  scenario 'I want to visit maker peeps page when not logged in' do
    visit '/peeps'
    expect(page).to have_content('Welcome to Maker Peeps')
  end

  xscenario 'I want to see peeps listed on page' do
    maker = Maker.log_in
    maker.create(peep_body: 'AAAA')
    visit '/peeps'
    within 'ol#peeps' do
    expect(page).to have_content('aa')
    end
  end
end

# As a maker
# So that I can better appreciate the context of a peep
# I want to see the time at which it was made

# As a maker
# So that I can see what others are saying
# I want to see all peeps in reverse chronological order
