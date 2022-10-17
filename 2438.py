# https://www.acmicpc.net/problem/2438

i = int(input());

for n in range(i + 1):
    if n == 0:
        continue

    print('*' * n)