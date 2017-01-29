describe Maker do
  context 'post a peep' do
  xit "tries to peep as maker with state 'logged_in' false" do
      let (:maker) { double('maker', :id => 2, :email => 'maker2@test.com', :name => 'maker_two',
      :handle => 'maker2', :logged_in => false) }
      let (:peep) { double('peep', :peep_body => "I'm not logged in", :peep_time => Time.now)}
      expect (maker2.logged_in).to eq(false)
      expect {maker2.post_peep}.to raise_error(raise_on_save_failure)
    end
  end
  xit "tries to peep as maker with state 'logged_in' true" do
      let (:maker) {double('maker', :id => 1, :email => 'maker1@test.com', :name => 'maker_one',
      :handle => 'maker1', :logged_in => true)}
      let (:peep) { double('peep', :peep_body => "I'm logged in", :peep_time => Time.now)}
      Subject.post_peep
      this_peep = Peep.first(:maker_id => 1)
      expect (this_peep.peep_body).to eq("I'm logged in")
  end
  end
