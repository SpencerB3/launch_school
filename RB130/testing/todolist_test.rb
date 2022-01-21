require 'simplecov'
SimpleCov.start

require 'minitest/autorun'
require "minitest/reporters"
Minitest::Reporters.use!

require_relative 'todo_list'

class TodoListTest < MiniTest::Test

  def setup
    @todo1 = Todo.new("Buy milk")
    @todo2 = Todo.new("Clean room")
    @todo3 = Todo.new("Go to gym")
    @todos = [@todo1, @todo2, @todo3]

    @list = TodoList.new("Today's Todos")
    @list.add(@todo1)
    @list.add(@todo2)
    @list.add(@todo3)
  end

  # Your tests go here. Remember they must start with "test_"

  def test_to_a
    assert_equal(@todos, @list.to_a)
  end

  def test_size
    assert_equal(3, @list.size)
  end

  def test_first
    assert_equal(@todo1, @list.first)
  end

  def test_last
    assert_equal(@todos.last, @list.last)
  end

  def test_shift
    todo = @list.shift
    assert_equal(@todo1, todo)
    assert_equal([@todo2, @todo3], @list.to_a)
  end

  def test_pop
    todo = @list.pop
    assert_equal(@todos.last, todo)
    assert_equal([@todo1, @todo2], @list.to_a)
  end

  def test_done_question
    assert_equal(false, @list.done?)
  end

  def test_add_raise_error
    assert_raises(TypeError) { @list << "not a Todo object" }
    assert_raises(TypeError) { @list << 44 }
  end

  def test_shovel_method
    todo = Todo.new('Walk the dog')
    @list << todo
    @todos << todo

    assert_equal(@todos, @list.to_a)
  end

  def test_add_alias
    todo = Todo.new('Feed the cat')
    @list.add(todo)
    @todos << todo

    assert_equal(@list.to_a, @todos)
  end

  def test_item_at
    assert_raises(IndexError) { @list.item_at(@list.size) }
    assert_equal(@todo1, @list.item_at(0))
    assert_equal(@todo2, @list.item_at(1))
  end

  def test_mark_done_at
    @list.mark_done_at(0)
    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, false)
    assert_equal(@todo3.done?, false)

    assert_raises(IndexError) { @list.mark_done_at(@list.size)}
  end

  def test_mark_undone_at
    @list.done!

    @todo1.undone!
    assert_equal(false, @todo1.done?)
    assert_equal(true, @todo2.done?)
    assert_equal(true, @todo3.done?)

    assert_raises(IndexError) { @list.mark_done_at(@list.size)}
  end

  def test_done_bang
    @list.done!
    assert_equal(@todo1.done?, true)
    assert_equal(@todo2.done?, true)
    assert_equal(@todo3.done?, true)
    assert_equal(@list.done?, true)
  end

  def test_remove_at
    assert_raises(IndexError) { @list.remove_at(@list.size)}

    todo = @list.remove_at(1)
    assert_equal(todo, @todo2)
    assert_equal([@todo1, @todo3],@list.to_a)
  end

  def test_to_s
    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [ ] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output, @list.to_s)
  end

  def test_to_s_one_todo_done
    @todo1.done!

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [ ] Clean room
    [ ] Go to gym
    OUTPUT

    assert_equal(output,@list.to_s)
  end

  def test_to_s_all_done
    @list.mark_all_done

    output = <<-OUTPUT.chomp.gsub /^\s+/, ""
    ---- Today's Todos ----
    [X] Buy milk
    [X] Clean room
    [X] Go to gym
    OUTPUT

    assert_equal(output,@list.to_s)
  end

  def test_each
    result = []
    @list.each { |todo| result << todo }
    assert_equal(result, @list.to_a)
  end

  def test_each_02
    result = @list.each {|todo| todo }
    assert_equal(result, @list)
  end

  def test_select
    result = @list.select { |todo| todo }
    assert_equal(result.is_a?(TodoList), true)

    @todo1.done!
    list = TodoList.new(@list.title)
    list.add(@todo1)

    assert_equal(@list.title, list.title)
    assert_equal(list.to_s, @list.select { |todo| todo.done? }.to_s)
  end 
end
