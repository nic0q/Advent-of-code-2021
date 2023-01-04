import numpy
matrix = numpy.zeros((1000, 1000))
f = open("aoc5.txt", "r")
lines = f.readlines()
f.close()

def reduceCords(cords):
  x1,y1,x2,y2 = int(cords[0][0]), int(cords[0][1]), int(cords[1][0]), int(cords[1][1])
  if(x1 == x2):
    if y1 < y2:
      for i in range(y1, y2 + 1, 1):
        matrix[x1][i] += 1
    else:
      for i in range(y2, y1 + 1, 1):
        matrix[x1][i] += 1
  else:
    if x1 < x2:
      for i in range(x1, x2 + 1, 1):
        matrix[i][y1] += 1
    else:
      for i in range(x2, x1 + 1, 1):
        matrix[i][y1] += 1

def getOverlapping(matrix):
  count = 0
  for i in range(0, len(matrix)):
    for j in range(0, len(matrix[i])):
      if(matrix[i][j] > 1):
        count += 1
  return count

coordinates = list(filter(lambda li : li[0][0] == li[1][0] or li[0][1] == li[1][1],
        list(map(lambda line : list(map(lambda line2 : line2.split(","),
          line.replace(" ->", "").replace("\n", "").split(" "))),lines))))

list(map(reduceCords, coordinates))
print(getOverlapping(matrix))