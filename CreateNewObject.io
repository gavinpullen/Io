Account := Object clone

// Account is defined as a clone of Object - sending a clone message to Object prototype

Account balance := 0

// := the initialization assignment operator creates a new slot on Account called balance   
// Account holds one slot named balance with the value of zero   
// A slot associates a value to a name within the context of a prototype   
// Slots can contain values or methods   

Account deposit := method(v, balance = balance + v)
Account withdraw := method(v, balance = balance - v)
Account show := method(writeln("Account balance: $", balance))
myAccount := Account clone
myAccount show
myAccount deposit(10)
myAccount show
