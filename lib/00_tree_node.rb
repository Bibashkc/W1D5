require 'byebug'

class PolyTreeNode
    attr_reader :value, :children, :parent
    def initialize(value)
        @value = value
        @parent = nil
        @children =[]
    end

    def parent=(node)
        if !@parent.nil? || node.nil? 
            @parent.delete(self) 
            @parent = node
            unless node.nil?
             node.children << self unless node.children.include?(self)
            end 
        else 
            @parent = node
             node.children << self unless node.children.include?(self)
        end 
    end

    def add_child(node)
        node.parent = self
    end

    def remove_child(node)
        node.parent = nil
    end

    def delete(node)
        @children = children.select do |ele|
              ele!=node
        end
    end

    def dfs(target)
        
    end

    def bfs(target)
        return self if self.value==target
        que = Queue.new
        que.enqueue(self)
        until que.show.nil?
            return que.show if que.show.value == target
            node = que.dequeue
            node.children.each do |n| 
                que.enqueue(n)
            end
        end
        return nil
    end
end

class Queue
    def initialize
        @arr = []
    end

    def enqueue(node)
        arr.push(node)
    end
    def dequeue
        arr.shift
    end
    def show
       arr.first
    end
    private
    attr_reader :arr
end

