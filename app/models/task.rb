class Task < ActiveRecord::Base
  belongs_to :person

  def self.count_completed(person_id)
    where(person_id: person_id).where.not(completed_at: nil).count
  end

  def self.count_not_completed(person_id)
    where(person_id: person_id).where(completed_at: nil).count
  end
end
