json.upcoming_jobs @upcoming_jobs do |job|
  json.id job.id
  json.client_id job.client_id
  json.jobdesc job.jobdesc
  json.address job.client.address
  json.price job.price
  json.sdate job.sdate
  json.stime job.stime
  json.notes job.notes
end


json.current_jobs @current_jobs do |job|
  json.id job.id
  json.client_id job.client_id
  json.jobdesc job.jobdesc
  json.address job.client.address
  json.price job.price
  json.sdate job.sdate
  json.stime job.stime
  json.notes job.notes
end


json.completed_jobs @completed_jobs do |job|
  json.id job.id
  json.client_id job.client_id
  json.jobdesc job.jobdesc
  json.address job.client.address
  json.price job.price
  json.sdate job.sdate
  json.stime job.stime
  json.crew job.crew
  json.datebi job.datebi
  json.recstatus job.recstatus
  json.notes job.notes
  json.job_logs job.logs
end
