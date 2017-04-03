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