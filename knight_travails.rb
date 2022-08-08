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
            child_node = new_move_positions(@root_node.value).each do |child|
                node = queue.shift 
                node.add_child(child)
                queue << child
            end
        end  
    end

    def new_move_positions(pos)
        new_positions = []
        possible_moves = KnightPathFinder.valid_moves(pos)
        possible_moves.reject!{|position| @considered_positions.include?(position)}
        possible_moves.each do |moves|
            @considered_positions << moves
            new_positions << moves
        end
        new_positions
    end

    def 

    end
end