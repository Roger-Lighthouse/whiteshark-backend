class Job < ApplicationRecord
  def logs
    log_items = JobLog.where('job_id = ?', id)
  end

end
