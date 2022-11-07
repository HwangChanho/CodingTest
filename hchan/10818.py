# https://www.acmicpc.net/problem/10818

N = int(input())

num_list = list(map(int, input().split()))

print(max(num_list), min(num_list))