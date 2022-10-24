# https://www.acmicpc.net/problem/2739

n = int(input())

for i in range(9):
    print('%d * %d = %d' %(n, i + 1, n * (i + 1)))