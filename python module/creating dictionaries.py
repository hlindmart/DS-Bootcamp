#part 1 - create 2 dictionaries for two different pets
susanna={
    'type': 'dog',
    'color': 'black',
    'nickname': 'Susie',
    'owner': 'Swahilee'}

sebastian={
    'type': 'dog',
    'color': 'white and brown',
    'nickname': 'Sebi',
    'owner': 'Geisha'
}

#part 1 - iterate over each dictionary printing each item on one line
for key, value in susanna.items():
    print(key+': '+value)

for key, value in sebastian.items():
    print(key+': '+value)

#part 2 - add 3 new dictionaries representing a city
pR={'Capital': 'San Juan'}
spain={'Capital': 'Madrid'}
scotland={'Capital': 'Edinburgh'}

#part 2 - add england, france, belgium to the file
england={'Capital': 'London'}
france={'Capital': 'Paris'}
belgium={'Capital': 'Brussels'}

#part 2 - add population, a fact, and top language spoken by locals to the above dictionaries
pR['Population']='2.69 million'
pR['Fact']='Has the oldest city in the Western hemisphere.'
pR['Language']='Spanish'

spain['Population']='46.79 million'
spain['Fact']='Has the second biggest city in the EU.'
spain['Language']='Spanish'

scotland['Population']='5.51 million'
scotland['Fact']='Home to the oldest trees in Europe.'
scotland['Language']='English'

england['Population']='53.01 million'
england['Fact']='Feeding pigeons in Trafalgar Square is banned.'
england['Language']='English'

france['Population']='66.9 million'
france['Fact']='France is smaller than Texas.'
france['Language']='French'

belgium['Population']='11.35 million'
belgium['Fact']='Belgium holds the world record for longest period without a government.'
belgium['Language']='Dutch'

#part 2 - loop through each one and print out all key-value pairs
for key, value in pR.items():
    print(key+': '+value)

for key, value in spain.items():
    print(key+': '+value)

for key, value in scotland.items():
    print(key+': '+value)

for key, value in england.items():
    print(key+': '+value)

for key, value in france.items():
    print(key+': '+value)

for key, value in belgium.items():
    print(key+': '+value)

#part 3 - add dictionary replicating a user's pizza order
pizza_order={
    'customer': 'Ginger Trevally',
    'size': 'Large',
    'crust': 'Gluten free',
    'toppings': 'bacon, pepperoni, green peppers'
}

#part 3 - print out the customer's order
print("Thank you for your order,", pizza_order.get('customer'))
print("You have ordered a", pizza_order.get('size'), pizza_order.get('crust'), "pizza with the following toppings:")
print(pizza_order.get('toppings'))