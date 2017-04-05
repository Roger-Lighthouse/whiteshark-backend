
class JobLogsController < ApplicationController

  def create

    job_log = JobLog.new
    job_log.job_id = params[:jobID]
    job_log.log_type = params[:logType]
    job_log.log_date = Date.today
    job_log.datebi = nil
    job_log.comments = params[:logComments]
    job_log.save!

    id = params[:jobID]
    job = Job.find id
    #fake_seed(params[:jobID], "Sign Pick Up", Date.today, nil, 'Test Logs')
    #@job_logs = []
    @completed_jobs = Job.where("client_id =? and datebi is not null", job.client_id)
    # @completed_jobs.each do |cj|
    #   @job_logs<<cj.logs
    # end
  end

  def show

  end

  def fake_seed(jobId, logType, logDate, logDatebi, comments)
    job_log = JobLog.new
    job_log.job_id = jobId
    job_log.log_type = logType
    job_log.log_date = logDate
    job_log.datebi = logDatebi
    job_log.comments = comments
    job_log.save!
  end

end