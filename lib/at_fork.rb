#$:.unshift(File.dirname(__FILE__)) unless
#  $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

ext_dir = File.dirname(__FILE__) + "/../ext/at_fork"
$:.unshift ext_dir unless $:.include?(ext_dir) || $:.include?(File.expand_path(ext_dir))


class AtFork
  VERSION = '0.0.1'

  def self.reset!
    @before_fork = []
    @after_fork_child = []
    @after_fork_parent = []
  end
  reset!

  def self.before &block
    require "at_fork.so"
    @before_fork.unshift block if block
  end

  def self.parent &block
    require "at_fork.so"
    @after_fork_parent.unshift block if block
  end

  def self.child &block
    require "at_fork.so"
    @after_fork_child.unshift block if block
  end

private
  def self.before_fork_handler #called by ext on forks..
    @before_fork.map(&:call)
  rescue
    # no exceptions are allowed on ll-hooks, this one hangs
  end

  def self.after_fork_child #called by ext on forks..
    @after_fork_child.map(&:call)
  rescue
    # no exceptions are allowed on ll-hooks, this one is not so dangerous - is bubbles into the child process, but cannot be catched there
  end

  def self.after_fork_parent #called by ext on forks..
    @after_fork_parent.map(&:call)
  rescue
    # no exceptions are allowed on ll-hooks, this one hangs
  end

end