class UsersController < ApplicationController

  def create
    puts 'hello ' + params[:username]
    puts 'Request' + request.body.to_s
    #puts params
    @user = { name: 'Hi Alex'}
  end
end
