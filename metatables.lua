-- a metatable is simply table associated with another table
-- if a table B is set as the metatable to another table A, then
-- A contains the reference to another table B

-- this becomes useful because the way lua access keys is
-- 1) check the table for the key
-- 2) if not present in table, checks the metatable's __index (not the metatable)
-- 3) if still not present return null

BaseClass = {}
BaseClass.__index = BaseClass -- Step 2 of key lookup

function BaseClass.new()
    local self = setmetatable({}, BaseClass)
    self.value = "Base value"
    return self
end

function BaseClass:getValue()
    return self.value
end

base_instance = BaseClass.new()
print("Base value from base instance: " .. base_instance:getValue()) -- "Base value"
