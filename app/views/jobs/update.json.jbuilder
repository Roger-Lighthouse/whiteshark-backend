
json.upcoming_jobs @upcoming_jobs do |job|
  json.id job.id
  json.client_id job.client_id
  json.jobdesc job.jobdesc
  json.price job.price
  json.sdate job.sdate
  json.stime job.stime
end


json.current_jobs @current_jobs do |job|
  json.id job.id
  json.client_id job.client_id
  json.jobdesc job.jobdesc
  json.price job.price
  json.sdate job.sdate
  json.stime job.stime
end


json.completed_jobs @completed_jobs do |job|
  json.id job.id
  json.client_id job.client_id
  json.jobdesc job.jobdesc
  json.price job.price
  json.sdate job.sdate
  json.stime job.stime
  json.crew job.crew
  json.recstatus job.recstatus
end