fish = ['fish', 'fiiish', 'fiiiiish', 'fiiiish', 'fffish', 'ffiiiiisshh', 'fsh', 'fiiiissshhhhhh']

def sluggish_octopus(fish)
    fish.each do |fish1|
        longest_fish = true
        fish.each do |fish2|
            if fish2.length > fish1.length
                longest_fish = false
            end
        end
        return fish1 if longest_fish
    end
end

#sluggish_octopus(fish)

def dominant_octopus(fish)
    return fish if fish.count <= 1

    midpoint = fish.count / 2
    sorted_left = dominant_octopus(fish.take(midpoint))
    sorted_right = dominant_octopus(fish.drop(midpoint))

    merge(sorted_left, sorted_right)
end

def merge(left, right)
    merged = []

    until left.empty? || right.empty?
        left.first.length < right.first.length ? merged << left.shift : merged << right.shift
    end
       
    merged.concat(left)
    merged.concat(right)
    merged  
end

#dominant_octopus(fish).last

def clever_octopus(fish)
    longest_fish = fish[0]
    fish.each do |fish|
        longest_fist = fish if fish.length > longest_fish.length
    end
end

#clever_octopus(fish)
