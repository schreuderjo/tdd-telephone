class List
  attr_reader :title, :tasks
  def initialize(title)
    @title = title
    @tasks = []
  end

  def add_task(task)
    tasks << task
  end

  def complete_all
    tasks.each do |task|
      task.mark_as_complete!
    end
  end

  def complete?
    tasks.each do |task|
      return false if task.status == "incomplete"
    end
    true
  end

  def completed_tasks
    completed_tasks = []
    tasks.each do |task|
      if task.status == "complete"
        completed_tasks << task
      end
    end
    completed_tasks
  end

  def incomplete_tasks
    incomplete_tasks = []
    tasks.each do |task|
      if task.status == "incomplete"
        incomplete_tasks << task
      end
    end
    incomplete_tasks
  end
end

class Task
  attr_reader :title, :description, :created_at
  attr_accessor :status
  def initialize(title, description)
    @title = title
    @description = description
    @status = "incomplete"
    @created_at = Time.now
  end

  def mark_as_complete!
    @status = "complete"
  end

  def mark_as_incomplete!
    @status = "incomplete"
  end

  def complete?
    @status == "complete"
  end

end

# list = List.new("grocery_list")
# p list.title
