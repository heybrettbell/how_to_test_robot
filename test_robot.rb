require 'minitest/autorun'
require 'minitest/pride'
require './robot.rb'

class TestRobot < MiniTest::Test

  def test_that_foreign_robot_neeing_repairs_sent_to_station_1
    #arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.foreign_model = true

    # act
    result = robot.station

    # assert
    assert_equal(result, 1)
  end

  def test_that_vintage_robot_needing_repairs_sent_to_station_2
    # arrange
    robot = Robot.new
    robot.needs_repairs = true
    robot.vintage_model = true
    # act
    result = robot.station
    # assert
    assert_equal(result, 2)
  end

  def test_that_standard_robot_needing_repairs_sent_to_station_3
    # arrange
    robot = Robot.new
    robot.needs_repairs = true

    # act
    result = robot.station
    # assert
    assert_equal(result, 3)
  end

  def test_that_robot_in_good_condition_sent_to_station_4
    # arrange
    robot = Robot.new
    # act
    result = robot.station
    # assert
    assert_equal(result, 4)
  end

  def test_prioritize_tasks_with_empty_todo_list_returns_negative_one
    # arrange
    robot = Robot.new
    # act
    result = robot.prioritize_tasks
    # assert
    assert_equal(result, -1)
  end

  def test_prioritize_tasks_with_todos_returns_max_todo_value
    # arrange
    robot = Robot.new
    robot.todos = [2, 8, 10, 20]
    # act
    result = robot.prioritize_tasks
    # assert
    assert_equal(result, 20)
  end

  def test_workday_on_day_off_returns_false
    # arrange
    robot = Robot.new
    robot.day_off = "sunday"
    # act
    result = robot.workday?("sunday")
    # assert
    assert_equal(false, result)
  end

  def test_workday_not_day_off_returns_true
    # arrange
    robot = Robot.new
    robot.day_off = "sunday"
    # act
      result = robot.workday?("tuesday")
    # assert
    assert_equal(true, result)
  end

end
