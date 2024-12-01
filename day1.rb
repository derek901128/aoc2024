# 2024 Day1
lhs, rhs = File
            .foreach("input.txt")
            .map {|pair| pair.split.map(&:to_i) }
            .transpose
            .map(&:sort)

# Part1
p lhs
    .zip(rhs)
    .map {|l, r| (l - r).abs }
    .sum

# Part2
p lhs
    .map{|l| l * rhs.count(l) }
    .sum
