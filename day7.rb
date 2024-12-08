require 'set'

OPS = ["*", "+"]
OPS2 = ["*", "+", "||"]

def repair(ops)
    correct = Set.new
    File.foreach("input.txt") do |equation|
        val, formula = equation.split(": ")
        val = val.to_i
        formula = formula.split
        
        ops.repeated_permutation(formula.size - 1).each do |op| 
            inter = formula[0]
            rest = formula[1..]
            (0..rest.size-1).each do |i|
                case op[i]
                when "||"
                    inter = eval("#{inter}#{rest[i]}")
                else
                    inter = eval("#{inter}#{op[i]}#{rest[i]}")
                end
            end
            if inter == val
                correct.add(inter) 
                break
            end
        end
    end
    correct.sum
end

part1 = repair(OPS)
part2 = repair(OPS2)

p part1
p part2