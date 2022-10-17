# https://www.acmicpc.net/problem/2675

case = int(input())

for _ in range(case):
    r, s = input().split()
    text = ''

    for i in s:
        text += int(r) * i
    
    print(text)

# case = int(input())

# for i in range(case):
#     num, s = input().split()

#     # print(r, p)