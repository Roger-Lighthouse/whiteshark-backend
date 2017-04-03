

# json.job_logs @job_logs do |job_log|
#   json.id job_log.id
#   json.job_id job_log.job_id
#   json.log_type job_log.log_type
#   json.log_date job.log_date
#   json.datebi job_log.datebi
# end


json.completed_jobs @completed_jobs do |job|
  json.id job.id
  json.client_id job.client_id
  json.jobdesc job.jobdesc
  json.price job.price
  json.sdate job.sdate
  json.stime job.stime
  json.crew job.crew
  json.datebi job.datebi
  json.recstatus job.recstatus
  json.job_logs job.logs
end