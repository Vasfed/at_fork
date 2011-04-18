require "test/unit"

$:.unshift File.dirname(__FILE__) + "/../ext/at_fork"
require "at_fork.so"

class TestAtForkExtn < Test::Unit::TestCase
  def test_simple
    AtFork.before{
      puts "before called"
    }
    AtFork.child{
      puts "child handler"
    }

    fork(){
      puts "child started"
      exit
      }
  end

  def test_catches_exceptions
    AtFork.reset!
    AtFork.before{
      puts "before called, raising"
      raise "test"
    }
    fork{ exit }

    AtFork.reset!
    AtFork.child{
      puts "child called, raising"
      raise "test"
    }
    fork{ exit }


    AtFork.reset!
    AtFork.parent{
      puts "parent called, raising"
      raise "test"
    }

    fork{ exit }
  end
end