class Task < ActiveRecord::Base

  def complete_time
    complete = completed_at ? "Completed at: #{completed_at.to_s}" : "Currently Incomplete..."
    return complete
  end

  def complete?
    complete = completed_at != nil
    return complete
  end

  def complete_question
    completed ? 'Mark Incomplete...' : 'Mark Complete!'
  end


end
