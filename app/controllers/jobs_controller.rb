class JobsController < ApplicationController
  def create
    puts 'Got Here IN CREATE ************'
    puts params.inspect
    #puts 'Request' + request.body.username
    #puts params

    params[:jobTime] = '10 AM'

    job = Job.new
    job.client_id = params[:clientId]
    job.jobdesc = params[:jobDesc]
    job.price = params[:jobPrice]
    job.sdate = params[:jobDate]
    job.stime = params[:jobTime]
    job.save!

#=begin
    job = Job.new
    job.client_id = params[:clientId]
    job.jobdesc = params[:jobDesc]
    job.price = params[:jobPrice]
    job.sdate = Date.today + 5
    job.stime = params[:jobTime]
    job.save!


    job = Job.new
    job.client_id = params[:clientId]
    job.jobdesc = params[:jobDesc]
    job.price = params[:jobPrice]
    job.sdate = Date.today
    job.stime = params[:jobTime]
    job.save!

    job = Job.new
    job.client_id = params[:clientId]
    job.jobdesc = params[:jobDesc]
    job.price = params[:jobPrice]
    job.sdate = Date.today-5
    job.datebi = Date.today-5
    job.stime = params[:jobTime]
    job.save!

    job = Job.new
    job.client_id = params[:clientId]
    job.jobdesc = params[:jobDesc]
    job.price = params[:jobPrice]
    job.sdate = Date.today-10
    job.datebi = Date.today-10
    job.stime = params[:jobTime]
    job.save!
#=end
    getJobs(params[:client_id])
  end

  def destroy
    id = params[:id]
    job = Job.find id
    job.destroy
    @upcoming_jobs = Job.where("sdate > ?", Date.today)
  end

  def update
    id = params[:id]
    job = Job.find id
    job.datebi = Date.today
    job.crew = 'Jason Burke'
    job.recstatus = 'Receivable'
    job.save!
    getJobs(job.client_id)
  end

   private

   def getJobs(client_id)
     @completed_jobs = []
     @current_jobs = []
     @upcoming_jobs = []
     jobs = Job.where("client_id = ?", job.client_id)
     jobs.each do |job|
       if job.datebi != nil
         @completed_jobs<<job
       elsif job.sdate == Date.today
         @current_jobs<<job
       elsif job.sdate > Date.today
         @upcoming_jobs<<job
       end
     end
   end
end
