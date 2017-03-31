class JobsController < ApplicationController
  def create
    puts 'Got Here IN CREATE ************'
    puts params.inspect
    #puts 'Request' + request.body.username
    #puts params

    job = Job.new
    job.client_id = params[:clientId]
    job.jobdesc = params[:jobDesc]
    job.price = params[:jobPrice]
    job.sdate = params[:jobDate]
    job.stime = params[:jobTime]
    job.save!
    @jobs = Job.where("client_id = ?", job.client_id)

  end
end
