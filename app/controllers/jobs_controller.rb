class JobsController < ApplicationController
  def create
    puts 'Got Here IN CREATE ************'
    puts params.inspect
    #puts 'Request' + request.body.username
    #puts params

    job = Job.new
    job.client_id = params[:client_id]
    job.jobdesc = params[:jobdesc]
    job.price = params[:price]
    job.sdate = params[:sdate]
    job.stime = '10am'
    job.save!
    @jobs = Job.where("client_id = ?", job.client_id)

  end
end
