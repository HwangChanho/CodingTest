# https://www.acmicpc.net/problem/11720
import sys

n = int(input())
m = input()

sum = 0

for i in range(n):
    sum += int(m[i])
    
print(sum)