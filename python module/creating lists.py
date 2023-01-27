#part 1 - create a list with several names
list_of_names=['Kurt', 'David', 'Katherine']

#part 1 - create for loop with each name that asks where are they today
for name in list_of_names:
    print("Where is", name, "today?")

#part 2 - three lists of my favorite stuff
my_favorite_cars=['Volvo XC90', 'Subaru Forester', 'Kia Soul']
my_favorite_flowers=['Dandelion', 'Calendula', 'Rose', 'Daisy']
my_favorite_animals=['Beluga Whale', 'Orca', 'Jellyfish', 'Poodle', 'Siberian Cat']

#part 2 - concatenate the 3 lists into one
my_favorite_things=my_favorite_cars + my_favorite_flowers + my_favorite_animals

#part 2 - with a for loop print out each item with an even length
for fave in my_favorite_things:
    if len(fave) %2==0:
        print(fave)

#part 3 - create a list with nums 1-20
number_range=[1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]

#part 3 - create a for loop for num that divides 3&5, only 3, and only 5
for num in number_range:
    if num %3==0 and num %5==0:
        print("ZipZap")
    elif num %3==0:
        print("Zip")
    elif num %5==0:
        print("Zap")
    else:
        print(num)