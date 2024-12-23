-- this is a simple script for solving the 2 sum problem

local some_input = {3,2,1,4,5}

--sorting
-- table.sort(some_input) -- inplace sorting

function sorted_copy(some_table)
	table_copy ={unpack(some_table)}
	table.sort(table_copy)
	return table_copy
end

some_input = sorted_copy(some_input)

local target = 3

local left_ptr = 1
local right_ptr= #some_input 

while left_ptr~= right_ptr do
	local result = some_input[left_ptr] + some_input[right_ptr]
	if result == target then
		print(some_input[left_ptr].." + "..some_input[right_ptr])
		break
	elseif result>target then
		-- result is greater than target we need to reduce the upper limit
		right_ptr  = right_ptr - 1
		print("reducing right pointer")
	else
		-- result is smaller than target we need to increase the lower limit
		left_ptr = left_ptr + 1
	end
end
