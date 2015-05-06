// more complex conditionals
if (2*2 == 5) {
  // won't show up because 2*2 is NOT 5
  println("2*2 == 5"); 
} else if(2*2 == 4) {
  // the else if ... condition will show up because 2*2 is equals 4
  println("2*2 == 4"); 
} else {
  // the else (fallback if none of the above matches) won't show up
  println("print this"); 
}
