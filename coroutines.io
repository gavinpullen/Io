blueCar := Object clone 
blueCar talk := method(
    "I am a blue car, What colour are u?" println
    yield 
    "No more rhymes now, I mean it." println
    yield)
    
redCar := Object clone
redCar rhyme := method(
    yield 
    "I am a red car, DO DO DO DO" println
    yield 
    "Anybody want a peanut?" println)
    
blueCar @@talk; redCar @@rhyme

Coroutine currentCoroutine pause

// blueCar and redCar are independant instances of Object with coroutines
// We fire asynchronous talk and rhyme methods - these run concurrently
// They voluntarily yield control to the other at specified intervalus with the yield message
// The last pause waits until all async messages complete and then exits
// 2 processes that need to coordinate can easily do so
