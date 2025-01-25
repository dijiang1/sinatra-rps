require 'sinatra'
require 'sinatra/reloader' if development?
require 'better_errors'
require 'binding_of_caller'

# Configuration for better_errors
use BetterErrors::Middleware
BetterErrors.application_root = __dir__
BetterErrors::Middleware.allow_ip!('0.0.0.0/0.0.0.0')

# Method to determine the game outcome
def determine_outcome(player_choice, computer_choice)
  if player_choice == computer_choice
    'tied!'
  elsif (player_choice == 'rock' && computer_choice == 'scissors') ||
        (player_choice == 'paper' && computer_choice == 'rock') ||
        (player_choice == 'scissors' && computer_choice == 'paper')
    'won!'
  else
    'lost!'
  end
end

# Route for the homepage
get '/' do
  erb :homepage
end

# Route for playing rock
get '/rock' do
  @player_choice = 'rock'
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @outcome = determine_outcome(@player_choice, @computer_choice)
  erb :rock
end

# Route for playing paper
get '/paper' do
  @player_choice = 'paper'
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @outcome = determine_outcome(@player_choice, @computer_choice)
  erb :paper
end

# Route for playing scissors
get '/scissors' do
  @player_choice = 'scissors'
  @computer_choice = ['rock', 'paper', 'scissors'].sample
  @outcome = determine_outcome(@player_choice, @computer_choice)
  erb :scissors
end

