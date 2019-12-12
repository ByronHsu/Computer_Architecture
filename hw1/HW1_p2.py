in_r, in_c = 5, 5
out_r, out_c = 3, 3
a = [
    [1, 2, 3, 4, 5],
    [6, 7, 8, 9, 10],
    [11, 12, 13, 14, 15],
    [16, 17, 18, 19, 20],
    [21, 22, 23, 24, 25]
]
b = [
    [0, 0, 0],
    [0, 0, 0],
    [0, 0, 0]
]
tmp = [0] * 9

off_r, off_c = 1, 1

for r in range(out_r):
    for c in range(out_c):
        tmp[0] = a[r][c]
        tmp[1] = a[r][c + 1]
        tmp[2] = a[r][c + 2]
        tmp[3] = a[r + 1][c]
        tmp[4] = a[r + 1][c + 1]
        tmp[5] = a[r + 1][c + 2]
        tmp[6] = a[r + 2][c]
        tmp[7] = a[r + 2][c + 1]
        tmp[8] = a[r + 2][c + 2]
        tmp.sort()
        b[r][c] = tmp[4]

print(b)