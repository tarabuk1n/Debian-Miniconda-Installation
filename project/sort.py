a = [456,33,2,57,876,38,55,10]
b = 1 
while b < len(a):
     for i in range(len(a)-b):
          if a[i] > a[i+1]:
               a[i],a[i+1] = a[i+1],a[i]
     b = b + 1

print (a)