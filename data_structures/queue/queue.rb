# simple queue implementation based on array

class Queue
  def initialize
    @queue = []
  end

  def head
    @queue.first
  end

  def tail
    @queue.last
  end

  def enqueue queue
    @queue.push queue
  end
  alias_method :add, :enqueue

  def dequeue
    @queue.delete_at(0) unless @queue.empty?
  end
  alias_method :rm, :dequeue

  def length
    @queue.length
  end
  alias_method :size, :length

  def empty?
    @queue.empty?
  end

  def each &block
    @queue.each do |queue|
      block.call queue
    end
  end

  def debug
    puts '***' * 20
    puts @queue
    puts '***' * 20
  end

  def keys
    puts @queue.map.with_index{|q, i| i }.compact
  end
end
