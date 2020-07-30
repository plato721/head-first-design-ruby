# Head First Design Patterns in Ruby

Just playing around to see what they look like. The Strategy pattern was done more java-y (simulating interfaces and such), but I think as I go on, I'm just going to think about how I might actually do it in Ruby, versus trying to make the code behavior identical. Also, specs.

## Update for Observer Pattern

I'm losing steam on this.. Writing minutiae when I'm trying to instill the design patterns. But I felt pot-committed to Observer, so it is present to the extent the given Java examples are, plus some testing.

## State Pattern

What I like about this code..
* I had some fun with the randomization for winner, hand-rolling a something that is truthy 10% of the time
* I like how I can say that my winner requirement is met, because I tested it with 5000 turns of the gumball machine crank
* I like that `Winner` is-a `Sold`.. Just a simple little extension to double dispense. There are no other differences, so why duplicate?
* I like the `MINIMUM_SELLABLE` constant. On the Java side I used the same n of 2, although I think I used a magic number over there. |
The book's examples ignored the issue of honoring the "10% winner requirement" for low counts of gumballs, although I think it may have addressed dispensing beyond zero.

What I learned..

I saw that it can be quite acceptable to allow a state to have knowledge of other states. The book did address that it doesn't have to be done this way, but in reflecting, it doesn't seem like a horrible way to go.

 
