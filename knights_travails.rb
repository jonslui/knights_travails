class Knight
    attr_accessor :location, :children
    def initialize(location)
    @location = location
    @children = []
    end
end

class KnightsTravail
    attr_accessor :start_location, :target_location

    def initialize(start_location, target_location)
        @start_location = Knight.new(start_location)
        @target_location = target_location
    end

    def build_tree(current_queue = [self.start_location], level = 0)
        level += 1
        next_queue = []
            while current_queue.length > 0
                current_position = current_queue[0].location
                tmp_queue = []

                tmp_queue << Knight.new([ current_position[0] + 1 , current_position[1] + 2 ])
                tmp_queue << Knight.new([ current_position[0] - 1 , current_position[1] + 2 ])
                tmp_queue << Knight.new([ current_position[0] + 2 , current_position[1] + 1 ])
                tmp_queue << Knight.new([ current_position[0] + 2 , current_position[1] - 1 ])
                tmp_queue << Knight.new([ current_position[0] + 1 , current_position[1] - 2 ])
                tmp_queue << Knight.new([ current_position[0] - 1 , current_position[1] - 2 ])
                tmp_queue << Knight.new([ current_position[0] - 2 , current_position[1] + 1 ])
                tmp_queue << Knight.new([ current_position[0] - 2 , current_position[1] - 1 ])

                # filter out instances which do not fit on the board
                tmp_queue = tmp_queue.select { |knight| knight.location[0] >= 1 && knight.location[0] <= 8 && knight.location[1] >= 1 && knight.location[1] <= 8 }
                
                tmp_queue.each do |knight|
                    if knight.location == self.target_location
                        return "FINISHED IN #{level} TURNS"
                    end
                    # add each child to the queue for the next function
                    next_queue << knight
                    # add each child to the current parent
                    current_queue[0].children << knight
                end
                # remove the front of the queue
                current_queue = current_queue.slice!(1..-1)
            end
            build_tree(next_queue, level)
    end



end

kt_instance = KnightsTravail.new([1,1],[5,5])
# puts kt_instance.start_location.location
# puts kt_instance.target_location
puts kt_instance.build_tree

# puts kt_instance.start_location.children[0]