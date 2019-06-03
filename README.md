# Bank App

### Tech test

### Brief and Approach






### Challenges

One interesting challenge was that, as I built my tests and wrote code to pass them, I noticed that some tests asking whether objects were instances of certain classes were passing when they shouldn't. For example, my printer class initializes with an instance of an account on it. Despite not requiring my Account class in the Printer class file, all my RSpec tests still passed.

A little research yielded the answer: it seems that if you run all of your RSpec tests at once, RSpec requires all your classes and they become available to one another for the purposes of the tests. However, if you run a test individually on a class that does not require a necessary class, the test now returns the expected failure.

![printer test fail](https://github.com/CalumDarroch/bank-test/blob/master/images/Screenshot%202019-06-03%20at%2019.01.06.png)

### Technologies
