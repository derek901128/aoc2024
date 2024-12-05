DIRECTIONS = {
            #col row
    "ri" => [0,   1],    # right
    "up" => [1,   0],    # up
    "rt" => [1,   1],    # right top 
    "rb" => [-1,  1],    # right bottom
    "lf" => [-1,  0],    # left
    "dn" => [0,  -1],    # down
    "lt" => [1,  -1],    # left top
    "lb" => [-1, -1]     # left bottom
}

def move(pos, dir)
    [pos[0] + DIRECTIONS[dir][0], pos[1] + DIRECTIONS[dir][1]]      
end

x = Hash.new()
m = Hash.new()
a = Hash.new()
s = Hash.new()

part1 = 0
part2 = 0

File.readlines("input.txt").each.with_index(1) do |row, rownum| 
    row.chomp.chars.each.with_index(1) do |char, colnum|
        case char
        when "X"
            x[[colnum, rownum]] = char
        when "M"
            m[[colnum, rownum]] = char
        when "A"
            a[[colnum, rownum]] = char
        when "S"
            s[[colnum, rownum]] = char
        end
    end
end

# Part1 

x.each do |k, v|
    DIRECTIONS.each do |_, d|
        score = 0
        1.upto(3) do |i|
            next_letter = [k[0] + d[0] * i, k[1] + d[1] * i]
            case i
            when 1
                score += 1 unless m[next_letter].nil?
            when 2 
                score += 1 unless a[next_letter].nil?
            when 3
                score += 1 unless s[next_letter].nil?
            end
        end
        part1 += 1 if score == 3
    end
end

# Part2

a.each do |k, v|
    rt = move(k, "rt")
    lt = move(k, "lt")
    rb = move(k, "rb")
    lb = move(k, "lb")

    if !m[rt].nil? && !m[rb].nil? && !s[lt].nil? && !s[lb].nil?
        part2 += 1
    end
    if !m[rt].nil? && !m[lt].nil? && !s[rb].nil? && !s[lb].nil? 
        part2 +=1 
    end 
    if !m[lt].nil? && !m[lb].nil? && !s[rt].nil? && !s[rb].nil? 
        part2 += 1
    end 
    if !m[lb].nil? && !m[rb].nil? && !s[lt].nil? && !s[rt].nil? 
        part2 += 1
    end 
end        

p part1
p part2


