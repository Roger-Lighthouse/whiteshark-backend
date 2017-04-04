class Job < ApplicationRecord
  def logs
    log_items = JobLog.where('job_id = ?', id)
  end

  def client
    client = Client.find(client_id)
  end

end
