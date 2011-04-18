require "test/unit"

$:.unshift File.dirname(__FILE__) + "/../ext/at_fork"
require "at_fork.so"

class TestAtForkExtn < Test::Unit::TestCase
  def test_truth
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
end