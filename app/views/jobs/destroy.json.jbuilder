json.upcoming_jobs @upcoming_jobs do |job|
  json.id job.id
  json.client_id job.client_id
  json.jobdesc job.jobdesc
  json.address job.client.address
  json.price job.price
  json.sdate job.sdate
  json.stime job.stime
end
