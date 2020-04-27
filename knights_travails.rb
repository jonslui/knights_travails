class Knight
    attr_accessor :location, :children, :parent
    def initialize(location)
    @location = location
    @children = []
    @parent = nil
    end
end

class KnightsTravail
    attr_accessor :start_location, :target_location

    def initialize(start_location, target_location)
        @start_location = Knight.new(start_location)
        @target_location = target_location
    end

    def build_tree(current_queue = [self.start_location])
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
                    knight.parent = current_queue[0]
                    if knight.location == self.target_location
                        path(knight)
                        return
                    end
                    # add each child to the queue for the next function
                    next_queue << knight
                    # add each child to the current parent
                    current_queue[0].children << knight
                end
                # remove the front of the queue
                current_queue = current_queue.slice!(1..-1)
            end
            build_tree(next_queue)
    end

    def path(knight)
        path_array = []
        while knight.parent != nil
            path_array.push(knight.location)
            knight = knight.parent
        end
        path_array.push(knight.location)

        # reverse the array so that the starting position is at the front of the array
        path_array.reverse!

        # print the first move and remove it from the array
        print "Start:  #{path_array[0]}"
        puts
        path_array = path_array.slice(1..-1)

        # print the remaining moves and count up with each one
        path_array.each_with_index do |location, index|
            print "Move #{index + 1}: #{location}"
            puts
        end
    end



end

# value one is where you want to get to
# value two is where you want to go
kt_instance = KnightsTravail.new([1,1],[1,8])
kt_instance.build_tree
