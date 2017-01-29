# As a Maker
# So that I can post messages on Chitter as me
# I want to sign up for Chitter
feature 'sign up' do
   scenario 'I enter required details and can create an account' do
     expect { sign_up }.to change(Maker, :count).by(1)
     expect Maker.first(:email => 'a@aa.com').to include(:name => 'A.AAA')
   end

    xscenario 'I do not enter email and cannot create an account' do
      expect { sign_up }.not_to change(Maker, :count)
      click_button 'Sign up'
      expect Maker.first(:email => 'a@aa.com').not_to include(:name => 'A.AAA')
    end

    xscenario 'creates a joining peep' do
      expect { sign_up }.to change(Peep, :count).by(1)
      this_peep = Peep.first(:maker_id) => params [:maker_id])
      expect (this_peep.peep_body).to include("has joined")
     end

    xscenario 'I log in after sign up and see a link to post a peep' do
      visit ('/session/log_in')
      fill_in 'email', with: 'a@aa.com'
      fill_in 'password' with: 'xsdsaf'
      expect {find.link('Go ahead peep...').visible?}.to eq(true)
    end

end
