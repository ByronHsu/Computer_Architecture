import numpy as np
from argparse import ArgumentParser

def gen_string(n):
    return ''.join([np.random.choice(['A', 'T', 'C', 'G']) for i in range(n)])

parser = ArgumentParser()
parser.add_argument('m', type = int, help = "Length of sequence 1")
parser.add_argument('n', type = int, help = "Length of sequence 2")
args = parser.parse_args()

with open('test_data.txt', 'w') as file:
    file.write('    seq1: .asciiz "{}"\n'.format(gen_string(args.m)))
    file.write('    seq2: .asciiz "{}"\n'.format(gen_string(args.n)))
    file.write('    score: .word 0:{}\n'.format((args.m+1) * (args.n+1)))
    file.write('    dir: .word 0:{}\n'.format((args.m+1) * (args.n+1)))
    file.write('\n\n')
    file.write('.text\n')
    file.write('    main:\n')
    file.write('        li $s0, {}\n'.format(args.m))
    file.write('        li $s1, {}\n'.format(args.n))