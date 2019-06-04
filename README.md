# Bank App

### Tech test

This challenge was done as an example of a tech test during week 10 of the Makers Academy course.

### Brief and Approach

The following brief was provided:

**Requirements**
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

**Acceptance criteria**
Given a client makes a deposit of 1000 on 10-01-2012
And a deposit of 2000 on 13-01-2012
And a withdrawal of 500 on 14-01-2012
When she prints her bank statement
Then she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```



### Challenges

One interesting challenge was that, as I built my tests and wrote code to pass them, I noticed that some tests asking whether objects were instances of certain classes were passing when they shouldn't. For example, my printer class initializes with an instance of an account on it. Despite not requiring my Account class in the Printer class file, all my RSpec tests still passed.

A little research yielded the answer: it seems that if you run all of your RSpec tests at once, RSpec requires all your classes and they become available to one another for the purposes of the tests. However, if you run a test individually on a class that does not require a necessary class, the test now returns the expected failure.

![printer test fail](https://github.com/CalumDarroch/bank-test/blob/master/img/Screenshot%202019-06-03%20at%2019.01.06.png)

Relationship between classes began to get messy. I refactored the printer class to not have an account as an attribute, and instead simply contain a method for printing that takes an array as an argument. This allowed me to mock transactions on it!

### Technologies
