#!/usr/bin/python3

import numpy as np
import math

outf = open('2000.dat','w')
inf = open('2000.cube')


line = inf.readline()
line = inf.readline()
mps = line.strip().split()
lx = float(mps[1])
ly = float(mps[2])
lz = float(mps[3])
line = inf.readline()
mps = line.strip().split()
nx = int(mps[0])
dx = float(mps[1])
line = inf.readline()
mps = line.strip().split()
ny = int(mps[0])
dy = float(mps[2])
line = inf.readline()
mps = line.strip().split()
nz = int(mps[0])
dz = float(mps[3])

for i in range(113):
  line = inf.readline()

nline = nx*ny*nz//6 #(+1)
index = 1
circle0 = 0.71*1.8897259886
circle1 = 1.87848*1.8897259886
circle2 = 2.55994*1.8897259886
circle3 = 3.95311*1.8897259886
circle4 = 4.97*1.8897259886
sum0 = 0
sum1 = 0
sum2 = 0
sum3 = 0
sum4 = 0
while(True):
  line = inf.readline()
  mps = line.strip().split()
  for k in range(6):
    number = (index-1)*6+k+1
    ix = math.ceil(number/(ny*nz))
    iy = math.ceil((number-ny*nz*(ix-1))/nz)
    iz = number-ny*nz*(ix-1)-nz*(iy-1)
    if (ix > nx or iy > ny or iz > nz):
      print('error!')
      print(number)
      print(ix)
      print(iy)
      print(iz)
    cx = (ix-1)*dx+lx
    cy = (iy-1)*dy+ly
    cz = (iz-1)*dz+lz
    # print(ix)
    # print(iy)
    # print(iz)
    # print(' ')
    dist = np.sqrt(np.square(cx+1.161951)+np.square(cy))  # here H(Bohr) is -1.161951, 0, graphene plane in 0 (z)
    # if (dist < circle0):
    #   sum0 = sum0 + float(mps[k])
    # elif (dist < circle1):
    #   sum1 = sum1 + float(mps[k])
    # elif (dist < circle2):
    #   sum2 = sum2 + float(mps[k])
    # elif (dist < circle3):
    #   sum3 = sum3 + float(mps[k])
    # elif (dist < circle4):
    #   sum4 = sum4 + float(mps[k])
    if (dist < circle4):
      sum4 = sum4 + float(mps[k])
      if (dist < circle3):
        sum3 = sum3 + float(mps[k])
        if (dist < circle2):
          sum2 = sum2 + float(mps[k])
          if (dist < circle1):
            sum1 = sum1 + float(mps[k])
            if (dist < circle0):
              sum0 = sum0 + float(mps[k])
  index = index + 1
  if(index > nline):
    break;

# print(ny)
# print(nz)
# a = ny*nz
# print(a)
# test = 274625//(ny*nz)+1
# print(test)
# b = 274625//a+1
# print(b)
outf.write(str(sum0)+' '+str(sum1)+' '+str(sum2)+' '+str(sum3)+' '+str(sum4))
outf.close()
inf.close()
