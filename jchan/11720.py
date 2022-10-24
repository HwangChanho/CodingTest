# https://www.acmicpc.net/problem/11720

n = int(input())
num = input()

sum = 0

for i in range(n):
    sum += int(num[i])

print(sum)