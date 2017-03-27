class Person < ActiveRecord::Base
  has_many :tasks

  def self.count_completed(person_id)
    person = Person.find(person_id)
    tasks = person.tasks
    completed_at = tasks.where(completed_at: true)
    return completed_at.length
  end

  def self.count_not_completed(person_id)
    person = Person.find(person_id)
    task_count = person.tasks.length
    return task_count - count_completed(person_id)
  end
end
