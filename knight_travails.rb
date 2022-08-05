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
    end


    def initialize(position)
        @position = position
    end

    self.root_node = PolyTreeNode.new(position)

    def build_move_tree
    end


end