class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

   attr_reader :parent, :children, :value

    def parent=(node)
        return @parent = nil if node == nil
        if !@parent.nil?
            @parent.children.delete(self)
            @parent = node
            if !@parent.children.include?(self)
                @parent.children << self
            end
        else
            @parent = node
            @parent.children << self 
        end

    end

    def add_child(child_node)
       child_node.parent=(self)
    end

    def remove_child(child_node)
        # if child_node.nil?
        #     raise "error"
        # end
        if child_node.parent == nil
            raise "not a child"
        end
        child_node.parent = nil
    end

    def dfs(target_value)
        return self if self.value == target_value
        self.children.each do |child|
            result = child.dfs(target_value)
            return result if !result.nil?
        end
        return nil 
    end

    def bfs(target_value)
        queue = [self]
        while !queue.empty?
            start = queue.shift
            if start.value == target_value
                return start 
            else
                queue += start.children
            end
        end
        nil
    end
end






