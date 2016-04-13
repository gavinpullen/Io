// Sending an asynchronous message to any object makes it an actor. End of story.
// 1. Create 2 objects faster and slower
Io> slower := Object clone
Io> faster := Object clone

// 2. Add a method called start to each
Io>slower start := method(wait(2); writeln("slowly"))
Io>faster start := method(wait(1); writeln("faster"))

// 3. Call both methods sequentially
Io>slower start; faster start

// They start in order, because the first message must finish before the second can begin
// But we can easily make each object run in its own thread by preceding each message with @@
// Which will return quickly and return nil

// 4. Add an extra wait to the end so that all threads finish before the program terminates
Io>slower @@start; faster @@start; wait(3)

// We made both of these objects actors by sending an asynchronous message to them
