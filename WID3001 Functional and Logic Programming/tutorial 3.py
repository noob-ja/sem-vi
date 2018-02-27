from functools import reduce

#Question 1
arr1 = [1,2,3]
arr2 = [3,5,6]
arrRes = [x for x in map(lambda x,y:x+y,arr1,arr2)]
print(arrRes)
arrRes = [x for x in map(lambda i:arr1[i]+arr2[i], range(len(arr1)))]
print(arrRes)
arrRes = list(map(lambda x,y:x+y, arr1, arr2))
print(arrRes)

#Question 2
string = list('mississippi')
#method 1a
met1 = set();
for a in string:
    met1.add(a)
print(met1)
#method 1b
met1b = []
for x in string:
    if x not in met1b:
        met1b.append(x)
print(met1b)

#method 2
met2 = {x for x in string}
print(met2)

#method 3
met3 = set(map(lambda x:x,string))
print(met3)

#Question 3
arr = [9,5,8,4,2,1,6]
arr_res = reduce(lambda x,y: x+y, [x for x in map(lambda x:x,filter(lambda x:x%2==0, arr))])
print(arr_res)
