nums = {1,2,3,4,5,6}
nums = {0,1,2,3} & nums
print('#1', nums)
nums = filter(lambda x: x > 1, nums)
print('#2', nums)
print(len(list(nums)))
