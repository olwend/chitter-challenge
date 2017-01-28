require 'spec_helper'

feature 'peeps display' do
  scenario 'I want to visit maker peeps page when not logged in' do
    visit '/peeps'
    expect(page).to have_content('Welcome to Maker peeps')
  end

  scenario 'I want to see peeps listed on page' do
    Peep.create(handle: 'aa', peep_body: 'AAAA')
    visit '/peeps'
    within 'ul#links' do
    expect(page).to have_content('aa')
    end
  end
end

# As a maker
# So that I an stay in touch
# I can see peeps if not logged in
