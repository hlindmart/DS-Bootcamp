#part 1 - create 3 functions that accept 3 parameters
def sum_function(x,y,z):
    return x+y+z

def product_function(a,b,c):
    return a*b*c

def average_function(h,i,j):
    return (h+i+j)/3

#part 1 - print and call the above functions
print(sum_function(4,2,1))
print(product_function(3,6,9))
print(average_function(9,8,7))

#part 2 - create 3 lambda functions that do the same as in part 1
add_numbers= lambda d,e,f: d+e+f

multiply_numbers= lambda k,l,m: k*l*m

average_numbers= lambda n,o,p: (n+o+p)/3

#part 2 - print and call the above functions
print(add_numbers(7,6,8))
print(multiply_numbers(4,4,4))
print(average_numbers(1,9,7))

#part 3 - create 3 lists 
list_one=[4,6,88,24]
list_two=[17,34,9,5]
list_three=[63,20,98,4]

#part 3 - create lambda function that takes 3 nums and finds the average
average_maker= lambda q,r,s: (q+r+s)/3

#part 3 - use map() to compute the average at each index
map_results= map(average_maker, list_one, list_two, list_three)

#part 3 - print out the end result using list()
print(list(map_results))