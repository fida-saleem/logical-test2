# question no.1

data=[12, 7, 12, 5, 7, 9, 5, 12, 9, 7, 15]

duplicates=[]

for x in data:
    if data.count(x) > 1 and x not in duplicates:
        duplicates.append(x)

print("Duplicates value: ")

for x in duplicates:
    print(x,"->" , data.count(x),"Times")



# question no.2

ids = [1, 2, 3, 4, 5, 7, 8, 9, 10]

for i in range(1,11):
    if i not in ids:
        print("Missing ID: ",i)