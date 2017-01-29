
# As a Maker
# So that I can avoid others posting messages on Chitter as me
# I want to log out of Chitter


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
end
