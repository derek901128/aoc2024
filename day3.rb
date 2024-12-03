#part1

p File
    .readlines("input.txt")
    .map{|line| 
        line
        .scan(/mul\(\d+\,\d+\)/)
        .map{|i|
             i
             .scan(/\d+/)
             .map(&:to_i)
             .reduce{|a, b| a * b} }
             .sum 
    }
    .sum

# # part2 


gate = true
sum = 0

File.foreach("input.txt") do |line|
    line.scan(/mul\(\d+\,\d+\)|don\'t\(\)|do\(\)/) do |i|
        case i
        when "do()"
            gate = true
        when "don't()"
            gate = false
        else
            sum += i.scan(/\d+/).map(&:to_i).reduce { |a, b| a * b } if gate
        end
    end
end

p sum