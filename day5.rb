require 'set'

def incorrect?(line, rules)
    line
        .combination(2)
        .any?{|pair| rules.include?([pair[1], pair[0]])}
end 

rules, pages = 
    File
        .read("input.txt")
        .split "\n\n"

rulesset = 
    rules
        .split
        .map{|r| r.split("|").map(&:to_i)}
        .to_set

pages_formatted = 
    pages
        .split
        .map{|line| line.split(',').map(&:to_i)}

#part1

part1 =
    pages_formatted
        .reject{|line| incorrect?(line, rulesset)}
        .map{|line| line[line.size / 2]}
        .sum

#part2

results = []
pages_formatted.each do |line| 
    case incorrect?(line, rulesset)
    when false
        next
    else
        until !incorrect?(line, rulesset) do
            0.upto(line.size - 1).each_cons(2) do |pair|
                first, second = pair
                if incorrect?([line[first], line[second]], rulesset) 
                    line[first], line[second] = line[second], line[first]
                end
            end
        end
        results << line[line.size / 2]
    end
end

part2 = results.sum


p part1
p part2