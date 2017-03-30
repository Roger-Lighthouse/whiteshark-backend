#require 'Faker'


class UsersController < ApplicationController

  def create
    puts 'Got Here'
    puts params.inspect
    #puts 'Request' + request.body.username
    #puts params
    @user = { name: 'Hi Alex'}
   # puts Faker::Name.name
  end

  def index
    puts 'hello ' + params
  end


end
