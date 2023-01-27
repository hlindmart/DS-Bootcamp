#part 1 - import datetime module
import datetime

#part 1 - print the full date (you'll need the .now() function)
today=datetime.datetime.now()
print('Today is: ', today)

#part 1 - print the time (you'll need the .now() function)
time=datetime.datetime.now().time()
print('Time: ', time)

#part 2 - create a new string over four lines
poem_string="Tiny little secrets\n"
poem_string +="Get buried in the dirt,\n"
poem_string+="And if they were dug up,\n"
poem_string+="Someone would probably get hurt.\n"

#part 2 - create and open a new file for the poem
poem_file=open('poem.txt', 'w')
#part 2 - write the string
poem_file.write(poem_string)
#part 2 - close the file
poem_file.close()

#part 2 - re open the file in read mode
poem_file=open('poem.txt', 'r')
#part 2 - read and print the files
print(poem_file.read())
#part 2 - close the file
poem_file.close()