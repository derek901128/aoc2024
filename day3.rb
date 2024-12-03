def mul(instruction)
    instruction
        .scan(/\d+/)
        .map(&:to_i)
        .reduce{|a, b| a * b}  
end

#part1

file = File.read("day3_input.txt")

p file
    .scan(/mul\(\d+\,\d+\)/)
    .map{|i| mul i }
    .sum

# # part2 

p file
    .scan(/mul\(\d+\,\d+\)|don\'t\(\)|do\(\)/)
    .slice_before(/d.+/)
    .map{|grp|
        case grp.first
        when "do()" 
            grp.grep(/m.*/).map{|i| mul i }.sum
        when "don't()"
            0
        else
            grp.map{|i| mul i }.sum
        end
    }.sum
