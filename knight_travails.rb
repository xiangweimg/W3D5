require '00_tree_node.rb'
require 'byebug'

class KnightPathFinder

    attr_reader :position
    
    def self.valid_moves(pos)
        valid_locations = [[1,-2], [-2,-1], [-2,1], [-1,2], [2,-1], [2,1], [1,2], [-1,-2]]
        valid_moves = []
        valid_locations.each do |ele|
            if pos[0] + ele[0] >= 0 && pos[1] + ele[1] >= 0 && pos[0] + ele[0] < 8 && pos[1] + ele[1] < 8
                valid_moves << [pos[0] + ele[0], pos[1] + ele[1]]
            end
        end
        return valid_moves
    end


    def initialize(position)
        @position = position
        @root_node = PolyTreeNode.new(position)
        @considered_positions = [position]
    end

    def build_move_tree
        queue =[@root_node]
        until queue.empty?
            node = queue.shift
            new_move_positions(node.value).each do |child_value|
                child = PolyTreeNode.new(child_value)
                node.add_child(child)
                queue << child
            end
        end  
    end

    def new_move_positions(pos)
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_moves.reject!{|position| @considered_positions.include?(position)}
        possible_moves.each do |moves|
            @considered_positions << moves
        end
        possible_moves
    end

    #dfs
    def find_path(end_pos)
        final_node = @root_node.dfs(end_pos)
        trace_path_back(final_node)
    end

    def trace_path_back(node)
        path = []
        current_node = node
        while !current_node.parent.nil?
            path << current_node
            current_node = current_node.parent
        end
        return path.reverse
    end

end