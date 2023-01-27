faithful

eruptions.times <- faithful$eruptions

short <- eruptions.times[eruptions.times <=3]
long <- eruptions.times[eruptions.times >3]

short

long

mean(short)

mean(long)

sd(short)

sd(long)
