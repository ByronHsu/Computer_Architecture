import numpy as np

x = np.random.randint(4, size=16)
b = np.random.randint(4, size=16)
A = np.random.randint(4, size=(16, 16))

y = 2 * A.dot(x) + b

with open('data/vector_x_t3.dat', 'w') as f:
    for i in range(16):
        b_str = format(x[i], '008b')
        f.write(b_str + '\n')

with open('data/vector_b_t3.dat', 'w') as f:
    for i in range(16):
        b_str = format(b[i], '008b')
        f.write(b_str + '\n')

with open('data/vector_y_t3.dat', 'w') as f:
    for i in range(16):
        b_str = format(y[i], '008b')
        f.write(b_str + '\n')

with open('data/matrix_A_t3.dat', 'w') as f:
    for i in range(16):
        arr = []
        for j in range(16):
            b_str = format(A[i][j], '008b')
            arr.append(b_str)
        concat = '_'.join(arr)
        # print(concat)
        f.write(concat + '\n')
print(x)
print(b)
print(A)
print(y)
# print(x, b, A, y)
