# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'creating peeps' do

  xscenario 'As a logged in maker I can peep a new message' do
    #maker log in
    visit '/new'
    fill_in 'peep_body', with: 'AAAA'
    click_button 'Submit your peep'
    expect(current_path).to eq'/peeps'
    within 'ol#peeps' do
      expect(page).to have_content('AAAA')
   end
  end
end
