ice_grams <- c(0.96,1.51,2.17,3.85,4.45,6.02)

diam=function(w){
  2/2.54*(w/0.92*4/3*pi)^1/3
}

for(w in ice_grams){
  d=diam(w)
  cat(w, "grams", "equals to a sphere's diameter of", d, "\n")
}
