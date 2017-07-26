require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/activity'

class ActivityTest < Minitest::Test


  def test_it_exists
    activity = Activity.new("Brunch")
    assert_instance_of Activity, activity
  end

  def test_it_has_a_name
    activity = Activity.new("Brunch")
    assert_equal "Brunch", activity.name
  end

  def test_it_has_participants_by_default
    activity = Activity.new("Brunch")

    assert_equal({}, activity.participants)
  end

  def test_it_can_add_participants
    activity = Activity.new("Brunch")

    assert activity.participants.empty?

    activity.add_participant("Jim", 20)

    assert_equal({"Jim" => 20}, activity.participants)
  end

  def test_it_can_add_multiple_participants
    activity = Activity.new("Brunch")

    assert activity.participants.empty?

    activity.add_participant("Jim", 20)

    assert_equal({"Jim" => 20}, activity.participants)

    activity.add_participant("Joe", 40)

    assert_equal({"Jim" => 20, "Joe" => 40}, activity.participants)
  end

  def test_activity_has_a_cost
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)

    assert_equal 20, activity.total_cost

    activity.add_participant("Joe", 40)

    assert_equal 60, activity.total_cost
  end

  def test_cost_can_be_split
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)

    assert_equal 20, activity.total_cost

    activity.add_participant("Joe", 40)

    assert_equal 60, activity.total_cost

    assert_equal 30, activity.split
  end

  def test_it_can_calculate_amount_owed
    activity = Activity.new("Brunch")
    activity.add_participant("Jim", 20)

    assert_equal 20, activity.total_cost

    activity.add_participant("Joe", 40)

    assert_equal 60, activity.total_cost

    assert_equal({"Jim" => 10, "Joe" => -10}, activity.owed)
  end

end
