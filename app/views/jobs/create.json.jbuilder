json.jobs @jobs do |job|
  json.id job.id
  json.client_id job.client_id
  json.jobdesc job.jobdesc
  json.price job.price
  json.sdate job.sdate
  json.stime job.stime
end

json.jobs1 @jobs do |job|
  json.id job.id
  json.client_id job.client_id
  json.jobdesc job.jobdesc
  json.price job.price
  json.sdate job.sdate
  json.stime job.stime
end