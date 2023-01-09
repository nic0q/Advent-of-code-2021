import math

f = open("aoc6.txt", "r")
lines = f.readlines()
f.close()
fishes = lines[0].replace("\n", "").split(",")
fishes = list(map(lambda e: int(e), fishes))
days = 100

# [0,1,2,3,4,5,6,7,8]
# child[i]
def getChilds(offset, state, totalDays ,fishes):
    days = totalDays - offset - state
    childs = 0
    for i in range(0, days , 7):
        birtday = i + offset + state + 1
        if birtday != 0:
            fishes.append(birtday)
        childs+=1
    
    return childs

def lista(days, fishes):
    l = len(fishes)
    i = 0
    childs = l
    while i < childs:
        if i < l:
            childs += getChilds(0,fishes[i], days, fishes)
        else:
            childs += getChilds(8,fishes[i], days, fishes)
        i+=1
    return childs
print(lista(256, [3,4,3,1,2]))
