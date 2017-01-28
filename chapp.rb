require 'rubygems'
require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'
require './models/maker'

# controller for chitter app

class Chapp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'

  register Sinatra::Flash
  helpers do
    def current_user
      @current_user ||= User.get(session[:user_id])
    end
  end
  get '/' do
    'Hello Chapp!'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
