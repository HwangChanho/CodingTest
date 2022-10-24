# https://www.acmicpc.net/problem/8958

case = int(input())


for _ in range(case):
    ox = input()

    num = 0
    sum = 0

    for i in ox:
        if(i == 'X'):
            num = 0
        else:
            num += 1
            sum += num

    print(sum)
