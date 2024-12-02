def test(levels)
    diffs = levels.each_cons(2).map{|p| p[1] - p[0]}
    diffs.all?{|d| d.between?(1, 3)} || diffs.all?{|d| d.between?(-3, -1)}
end

one = 0
two = 0

File
    .readlines("input.txt")
    .group_by{|report| test report.split.map(&:to_i)}
    .each{ |k, v| 
        case k
        when true
            one = v.size
        when false
            two = v.select{|r| r.split.map(&:to_i).combination(r.split.size-1).any?{|c| test c} }.size 
        end
    }
  
p one       
p one + two