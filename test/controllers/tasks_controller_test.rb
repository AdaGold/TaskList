require "test_helper"

describe TasksController do
  let (:task) {
    Task.create name: "sample task", description: "this is an example for a test",
                completed_at: Time.now + 5.days
  }

  # Tests for Wave 1
  describe "index" do
    it "can get the index path" do
      # Act
      get tasks_path

      # Assert
      must_respond_with :success
    end

    it "can get the root path" do
      # Act
      get root_path

      # Assert
      must_respond_with :success
    end
  end

  # Unskip these tests for Wave 2
  describe "show" do
    it "can get a valid task" do

      # Act
      get task_path(task.id)

      # Assert
      must_respond_with :success
    end

    it "will redirect for an invalid task" do

      # Act
      get task_path(-1)

      # Assert
      must_respond_with :redirect
    end
  end

  describe "new" do
    it "can get the new task page" do


      # Act
      get new_task_path

      # Assert
      must_respond_with :success
    end
  end

  describe "create" do
    it "can create a new task" do


      # Arrange
      task_hash = {
          task: {
              name: "new task",
              description: "new task description",
              completed_at: nil,
          },
      }

      # Act-Assert
      expect {
        post tasks_path, params: task_hash
      }.must_change "Task.count", 1

      new_task = Task.find_by(name: task_hash[:task][:name])
      expect(new_task.description).must_equal task_hash[:task][:description]
      expect(new_task.completed_at).must_equal task_hash[:task][:completed_at]

      must_respond_with :redirect
      must_redirect_to task_path(new_task.id)
    end
  end

  # Unskip and complete these tests for Wave 3
  describe "edit" do
    it "can get the edit page for an existing task" do
      #Arrange

      #Act
      get edit_task_path(task.id)
      must_respond_with :success

    end

    it "will respond with redirect when attempting to edit a nonexistant task" do

      get edit_task_path(-1)
      must_respond_with :redirect


    end
  end

  # Uncomment and complete these tests for Wave 3
  describe "update" do

    it "can update an existing task" do

      old_task= task
      task_to_update_hash = {
          task: {
            name: 'task to update',
            description: 'this will be updated',
            completed_at: nil
        }
      }

      expect {
        patch task_path(old_task),params: task_to_update_hash
      }.wont_change "Task.count"
    end


    it "will redirect to the root page if given an invalid id" do
      # Your code here
      patch task_path(-10)

      must_respond_with :redirect
    end
  end

  # Complete these tests for Wave 4
  describe "destroy" do
    # Your tests go here
    it 'should delete an existing task and redirect to index page' do
      #Arrange
      task_to_delete = Task.create(
          name: 'task to delete',
          description: 'this will be deleted',
          completed_at: nil)

      expect {
        delete task_path(task_to_delete)
      }.must_differ "Task.count", -1
    end


    it 'redirects if given invalid id' do

      delete task_path(-10)

      must_respond_with :redirect
    end
  end

  # Complete for Wave 4
  describe "mark_complete" do
    # Your tests go here



  end
end
