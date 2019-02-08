

class Searchable

    def initialize
    end
    def dfs
        return self
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