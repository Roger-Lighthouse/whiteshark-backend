class JobsController < ApplicationController
  def create
    puts 'Got Here'
    puts params.inspect
    #puts 'Request' + request.body.username
    #puts params
    @job = { jobdesc: 'W1'}

  end
end
