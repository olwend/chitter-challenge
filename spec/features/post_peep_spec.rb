# As a maker
# So that peeps are secure
# I want to be logged in prior to posting


# As a Maker
# So that I can let people know what I am doing
# I want to post a message (peep) to chitter
feature 'creating peeps' do
maker = double("create_peep_maker", :)
let(:maker){double :maker, }

  xscenario 'As a maker I can peep a new message' do
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
