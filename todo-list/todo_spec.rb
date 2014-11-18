require_relative 'todo.rb'

describe List do
  before :each do
    # Create an array of 5 items here and name it @items
    # - the InventoryItems should have the names of 'shoe', 'shirt', 'glove', 'hat', and 'sock', in that order
    # - each item should have an inventory that records the number of items of that color that are in stock
    # - the first item (the shoe) has five `'brown'`, four `'blue'`, three `'white'`, two `'gray'`, and one `'black'` in stock.
    @list = List.new("grocery_list")
    @task1 = Task.new("produce", "buy ten pounds of potatoes")
    @task2 = Task.new("meat", "buy ten pounds of filet mignon")
    @task3 = Task.new("whole grains", "buy ten pounds of oats")
    @list.add_task(@task1)
    @list.add_task(@task2)
  end

  # Do NOT modify any of these tests.

  describe '#initialize' do
    it 'should have a title' do
      expect(list.title).to eq('grocery_list')
    end

    it 'should have many tasks (it should be an array)' do
      expect(list.tasks).to be_kind_of Array
    end
  end

  describe '#add_task' do
    it 'should add a task' do
      list.add_task(task3)
      expect(list.tasks.length).to eq(3)
    end

    it 'should add a task object to the tasks array' do
      list.add_task(task3)
      expect(list.tasks.last).to be_kind_of Task
    end
  end

  describe '#complete_all!' do
    it 'should mark all tasks as complete' do
      list.complete_all
      status_array = []
      list.tasks.each do |task|
        status_array << task.status
      end
      expect(status_array.uniq).to eq(["completed"])
    end
  end

  describe '#complete?' do
    it 'should return true when all tasks are complete' do
      list.complete_all
      expect(list.complete?).to eq(true)
    end

    it 'should return false when any task is incomplete' do
      list.complete_all
      list.first.status = "incomplete"
      expect(list.complete?).to eq(false)
    end
  end

  describe '#completed_tasks' do
    it 'should return an array' do
      expect(list.completed_tasks).to be_kind_of Array
    end

    it 'should return an array of task objects' do
      expect(list.completed_tasks.first).to be_kind_of Task
    end

    it 'should return an array of only completed tasks' do
      list.complete_all
      list.first.status = "incomplete"
      status_array = []
      list.completed_tasks.each do |task|
        status_array << task.status
      end
      expect(status_array.uniq).to eq(["completed"])
    end
  end

  describe '#incomplete_tasks' do
    it 'should return an array of only incomplete tasks' do
      list.first.status = "completed"
      status_array = []
      list.incomplete_tasks.each do |task|
        status_array << task.status
      end
      expect(status_array.uniq).to eq(["incomplete"])
    end
  end
end

describe Task do

  let(:task) { Task.new("produce", "buy ten pounds of potatoes") }

  describe '#initialize' do
    it 'should have a title' do
      expect(task.title).to eq("produce")
    end

    it 'should have a description' do
      expect(task.description).to eq("buy ten pounds of potatoes")
    end

    it 'should have a default status of incomplete' do
      expect(task.status).to eq("incomplete")
    end

    it 'should have a created_at attribute upon instantiation' do
      expect(task.created_at).to be_kind_of Time
    end
  end

  describe '#mark_as_complete!' do
    it 'should set status to complete' do
      task.mark_as_complete!
      expect(task.status).to eq("complete")
    end
  end

  describe '#mark_as_incomplete' do
    it 'should set status to incomplete' do
      task.mark_as_incomplete!
      expect(task.status).to eq("incomplete")
    end
  end

  describe '#complete?' do
    it 'should return false if the task is incomplete' do
      expect(task.complete?).to eq(false)
    end

    it 'should return true if the task is completed' do
      task.mark_as_complete!
      expect(task.complete?).to eq(true)
    end
  end
end

