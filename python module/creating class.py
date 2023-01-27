#part 1 - create a class named stadium
class Stadium:
    """This will provide info about a stadium."""
    def __init__(self, name, city_state, capacity, sport, seats):
        """This will provide info about a stadium."""
        self.name=name
        self.city_state=city_state
        self.capacity=capacity
        #part 2 - adding relevant arguments
        self.sport=sport
        self.seats=seats

    def describe_stadium(self):
        """This will describe the stadium."""
        print("The "+self.name+" is located in "+self.city_state+" and holds "+self.capacity+ " fans.")

    #part 2 - add two more methods to this class
    def sport_played(self):
        """This will specify the sport played in the stadium."""
        print("The following sport is mainly played in this stadium: "+self.sport)

    def seats_available(self):
        """This will specify how many seats available."""
        print("There are "+self.seats+" seats still available for tonight's game.")

#part 1 - stadium instance
stadium1=Stadium("AT&T Stadium", "Arlington, TX", "80,000", "Football", "3,956")

#part 1 - calling out description of stadium through instance
stadium1.describe_stadium()

#part 2 - calling out remainder methods through instance
stadium1.sport_played()
stadium1.seats_available()