#part 1 - concatenate string variables together to form my birthday
day="1"
month="September"
year="1993"

my_birthday=month + " " + day + "," + " " + year
print(my_birthday)

#part 2 - concatenate the variables first, second, third, and fourth to form variable final in caps
first="happy"
second="birthday"
third="to"
fourth="you"

final=first + " " + second + " " + third + " " + fourth
print(final.upper())

#part 3 - if the given age allows the attendee to see the movie by printing out a specific message based on the age
age=15

if age <=10:
    print("Not permitted")
elif age <=15:
    print("Permitted with a parent")
elif age <18:
    print("Permitted with anyone over 18")
elif age >=18:
    print("Permitted to attend alone")