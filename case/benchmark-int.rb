require "benchmark"

loop = (ARGV.shift||10000).to_i
range1 = 0..9
range2 = 10..19
array1 = range1.to_a
array2 = range2.to_a

C0,C1,C2,C3,C4,C5,C6,C7,C8,C9 = 0,1,2,3,4,5,6,7,8,9
C10,C11,C12,C13,C14,C15,C16,C17,C18,C19 = 10,11,12,13,14,15,16,17,18,19

v0,v1,v2,v3,v4,v5,v6,v7,v8,v9 = 0,1,2,3,4,5,6,7,8,9
v10,v11,v12,v13,v14,v15,v16,v17,v18,v19 = 10,11,12,13,14,15,16,17,18,19

Benchmark.bmbm(18) do |x|
  x.report "case when 0,1,2" do
    loop.times do
      30.times do |i|
        case i
        when 0,1,2,3,4,5,6,7,8,9
        when 10,11,12,13,14,15,16,17,18,19
        end
      end
    end
  end

  x.report "case when v0,v1,v2" do
    loop.times do
      30.times do |i|
        case i
        when v0,v1,v2,v3,v4,v5,v6,v7,v8,v9
        when v10,v11,v12,v13,v14,v15,v16,v17,v18,v19
        end
      end
    end
  end

  x.report "case when C0,C1,C2" do
    loop.times do
      30.times do |i|
        case i
        when C0,C1,C2,C3,C4,C5,C6,C7,C8,C9
        when C10,C11,C12,C13,C14,C15,C16,C17,C18,C19
        end
      end
    end
  end

  x.report "case when C0,1,2" do
    loop.times do
      30.times do |i|
        case i
        when C0,1,2,3,4,5,6,7,8,9
        when C10,11,12,13,14,15,16,17,18,19
        end
      end
    end
  end

  x.report "case when v0,1,2" do
    loop.times do
      30.times do |i|
        case i
        when v0,1,2,3,4,5,6,7,8,9
        when v10,11,12,13,14,15,16,17,18,19
        end
      end
    end
  end

  x.report "if range.include?" do
    loop.times do
      30.times do |i|
        if range1.include?(i)
        elsif range2.include?(i)
        end
      end
    end
  end

  x.report "if (0..2).include?" do
    loop.times do
      30.times do |i|
        if (0..9).include?(i)
        elsif (10..19).include?(i)
        end
      end
    end
  end

  x.report "case when range" do
    loop.times do
      30.times do |i|
        case i
        when range1
        when range2
        end
      end
    end
  end

  x.report "case when 0..2" do
    loop.times do
      30.times do |i|
        case i
        when 0..9
        when 10..19
        end
      end
    end
  end

  x.report "if array.include?" do
    loop.times do
      30.times do |i|
        if array1.include?(i)
        elsif array2.include?(i)
        end
      end
    end
  end

  x.report "if [0,1,2].include?" do
    loop.times do
      30.times do |i|
        if [0,1,2,3,4,5,6,7,8,9].include?(i)
        elsif [10,11,12,13,14,15,16,17,18,19].include?(i)
        end
      end
    end
  end

  x.report "case when *array" do
    loop.times do
      30.times do |i|
        case i
        when *array1
        when *array2
        end
      end
    end
  end

  x.report "case when *[0,1,2]" do
    loop.times do
      30.times do |i|
        case i
        when *[0,1,2,3,4,5,6,7,8,9]
        when *[10,11,12,13,14,15,16,17,18,19]
        end
      end
    end
  end
end
