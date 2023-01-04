f = open("aoc4.txt", "r")
lines = f.readlines()
f.close()

numbers = [62,55,98,93,48,28,82,78,19,96,31,42,76,25,34,4,18,80,66,6,14,17,57,54,90,27,40,47,9,36,97,56,87,61,91,1,64,71,99,38,70,5,94,85,49,59,69,26,21,60,0,79,2,95,11,84,20,24,8,51,46,44,88,22,16,53,7,32,89,67,15,86,41,92,10,77,68,63,43,75,33,30,81,37,83,3,39,65,12,45,23,73,72,29,52,58,35,50,13,74]
# Store all the boards in a list
def storeData(lines):
  all = []
  # for each boardro
  for i in range(2,len(lines), 6):
    board = list(map(lambda lines : list(filter(lambda x : (x != ''), lines.replace("\n", "").split(" "))) , lines[i:i+5]))
    all.append(board)
  return all

# Mark the number in the board 
def markBoard(board, num):
  for i in range(0, len(board)):
    for j in range(0, len(board[i])):
      if(int(board[i][j]) == num):
        board[i][j] = -1
  return board
# Check if there is a row with all -1 (Row's win)
def winRow(board):
  if([-1,-1,-1,-1,-1] in board):
    return True
  return False

# Check if there is a column with all -1 (Column's win)
def winCol(board):
  for i in range(0, len(board)):
    if(board[0][i] == -1 and board[1][i] == -1 and board[2][i] == -1 and board[3][i] == -1 and board[4][i] == -1):
      return True
  return False

# Sum all the numbers that are not marked
def sumUnmarked(board, winNumber):
  sum = 0
  for i in range(0, len(board)):
    for j in range(0, len(board[i])):
      if(board[i][j] != -1):
        sum += int(board[i][j])
  return sum * winNumber

# Check if there is a winner
def winner(all):
  for n in numbers:
    for board in all:
      board = markBoard(board, n)
      if(winRow(board) or winCol(board)):
        print("WINNER")
        print(sumUnmarked(board, n))
        return
      print(markBoard(board, n))

winner(storeData(lines))