ENV["RACK_ENV"] ||= "development"
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
    def current_maker
      @current_maker ||= Maker.get(session[:maker_id])
    end
  end

  get '/' do
      redirect '/users/new'
  end

  get '/peeps' do
    #  @all_peeps = Peep.all
     erb :'peeps/index'
  end

  get '/peeps/new' do
    erb :'peeps/new'
  end

  post '/peeps' do
    new_peep = Peep.create(peep_body: params[:peep_body], maker_id: session[:maker_id])
    new_peep.save
    redirect :'/peeps'
  end

  get '/session/new' do
      erb :'session/new'
    end

    post '/session' do
      if maker = Maker.authenticate(params[:email], params[:password])
        session[:maker_id] = maker.id
        flash[:messages] = "log in successfull, #{params[:email]}"
        redirect '/peeps'
      else
        flash.now[:messages] = "username or password incorrect"
        erb :'/sessions/new'
      end
    end

  get '/users/new' do
    erb :'users/new'
  end

  post '/users' do

    maker = Maker.create(email: params[:email],
                       name: params[:name],
                       handle: params[:handle],
                       password: params[:password],
                       password_confirmation: params[:password_confirmation]
                       )
    if maker.valid?
      session[:maker_id] = maker.id
      redirect to('/peeps')
    else
      flash.now[:messages] = maker.errors.full_messages
      erb :'users/new'
    end
  end


  # start the server if ruby file executed directly
  run! if app_file == $0
end
