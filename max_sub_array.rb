class MaxSubArray
	
  attr_reader :input_arr

  def initialize
    puts "Enter an array of elements:"
    @input_arr = gets.chomp.split(' ').map(&:to_i)
  end

  def find_max
    count = start_index = end_index = max_sum = max_so_far = 0
    unless input_arr.all? {|item| item < 0}
      input_arr.each_with_index do |ele, index|
	if max_sum + ele > 0 
	  max_sum += ele
	  count += 1 
	else
	  count=0
	  max_sum = 0
	end

	if max_sum > max_so_far
	  max_so_far = max_sum
	  start_index = index if count == 1  || index != count
	  end_index = index
	  count = index
	end
      end
    else
      max_so_far = input_arr.max
      start_index = end_index = input_arr.index(max_so_far)
    end
    puts "Start Index: #{start_index}"
    puts "Length: #{end_index - start_index + 1}"
    puts "Sum: #{max_so_far}"
    puts "Elements: #{input_arr[start_index..end_index]}" 
  end
end

MaxSubArray.new.find_max
