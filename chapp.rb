ENV["RACK_ENV"] ||= "development"
require 'rubygems'
require 'sinatra/base'
require 'sinatra/flash'
require './data_mapper_setup'

# controller for chitter app

class Chapp < Sinatra::Base
  enable :sessions
  set :session_secret, 'super secret'


  register Sinatra::Flash
  get '/' do
    'Welcome to Maker peeps'
  end

  get '/peeps' do
    @peeps = Peep.all
    p Peep.all
    erb :'peeps/index'
  end

  post '/peeps' do
    p params[:handle]
    p params[:peep_body]
    peep = Peep.create(handle: params[:handle],
              peep_body: params[:peep_body])
    #peep.save
    p Peep.first
    redirect to('/peeps')
  end

  get '/new' do
    erb :'peeps/new'
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
