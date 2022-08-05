class PolyTreeNode
    def initialize(value)
        @value = value
        @parent = nil
        @children = []
    end

   attr_reader :parent, :children, :value

    def parent=(node)
        if !@parent.nil?
            @parent.children.delete(self)
        end
        @parent = node
        if !@parent.children.include?(self)
            @parent.children << self
        end
    end

    def add_child(child_node)
       child_node.parent=(self)
    end

    

end