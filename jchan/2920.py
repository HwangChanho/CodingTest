# https://www.acmicpc.net/problem/2920

nums = list(map(int, input().split()))

asce = [1,2,3,4,5,6,7,8]
desc = [8,7,6,5,4,3,2,1]

flag = ''

if(nums == asce):
      flag = 'ascending'
elif(nums == desc):
      flag = 'descending'
else:
    flag = 'mixed'
    

print(flag)