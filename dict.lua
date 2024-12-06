local someDict = {
    name = "Hamza",
    age = 25
}

for key, value in pairs(someDict) do
    print(key .. ":" .. value)
end

print(someDict.name)
