require 'spec_helper'

def sign_up(email: 'a@aa.com',
  name: 'A.AAA',
  handle: 'aaaa',
  password: 'xsdsaf',
  password_confirmation: 'xsdsaf')
    visit '/users/new'
    fill_in :email, with: email
    fill_in :name, with: name
    fill_in :handle, with: handle
    fill_in :password, with: password
    fill_in :password_confirmation, with: password_confirmation
    click_button 'Sign Up'
  end
