local someArray = { 1, 2, 3 }
for i = 1, #someArray, 1 do -- # is used to get the size of arrays in lua
    print(someArray[i])
end
print(someArray[0]) -- will be nil since lua arrays are 1-indexed
for i = #someArray, 1, -1 do
    print(someArray[i])
end
