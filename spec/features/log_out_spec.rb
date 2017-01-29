
feature 'logging out ' do
# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter
xscenario 'maker logs out' do

end

# As a Maker
# So that I can leave PC sure that nobody can post as me
# I do want to be able to post a peep when not logged in
feature 'creating peeps' do
  xscenario 'As a logged out maker I cannot peep a new message' do
    #maker sign in
    visit '/new'
    fill_in 'peep_body', with: 'AAAA'
    click_button 'Submit your peep'
    expect(current_path).to eq'/peeps'
    within 'ul#peeps' do
      expect(page).to have_content('AAAA')
   end
  end

  # As a maker
  # So that I an stay in touch
  # I can still see peeps if not logged in
