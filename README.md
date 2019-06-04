# Bank App

### Tech test

This challenge was done as an example of a tech test during week 10 of the Makers Academy course.

### Installation

To install this app, clone this repository to your machine:

```
git@github.com:CalumDarroch/bank-test.git
```

Install all required gems by running:

```
bundle install
```

Finally, you can run the tests using:

```
rspec
```

### Brief

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

### Approach

From the above brief I derived the following user stories:

```
As a user,
So that I can interact with the program,
I want to be able to run it in IRB.
```

```
As a user,
So that I can keep track of my money,
I want to be able to create a new account.
```

```
As a user,
So that I can store my money in my account,
I want to be able to deposit it.
```

```
As a user,
So that I can use my money,
I want to be able to withdraw it from my account.
```

```
As a user,
So that I can keep track of my incomings and outgoings,
I want to be able to view a record of all my transactions with the dates they occurred.
```

I decided that my program would require at least 3 classes: an `Account` class that would store a balance and a list of transactions, a `Transaction` class that would contain a record of each transaction (whether a deposit or a withdrawal) and a `Printer` class that could display the information to the user in an easily readable format, as per the brief above.

I began by creating the Account class, which initializes with an empty array which can be filled with Transactions. It allows the user to `deposit` and `withdraw` money, and contains an instance variable `@account_balance` which keeps track of the account's total balance, and also allows the balance at the time of a transaction to be recorded on a Transaction instance.

The Transaction class initializes with three instance variables: `@date` calculated with `Time.now` (and formatted using `strftime`), the `@amount` transferred, and the `@balance` on the account as the result of that transaction.

Finally, the Printer class contains a `print` method which takes an array of Transactions as an argument, and `puts` each of them to the console in reverse order (i.e. latest transaction first) with reference headers.

Finally, the Account class initalizes with a Printer object stored on it, and has a `print_statement` method which tells the printer to run its `print` method with the Account's `@transactions` array provided as an argument.

This relationship between the classes allows the user to interact with all of them simply in the REPL (e.g. if an instance of the Account class is assigned to a variable "account", the user need only type `account.print_statement` to view their statement, despite it running a method on the Printer class). Also, the Transaction and Printer classes are completely isolated from the Account class for testing. 

### Challenges

One interesting challenge was that, as I built my tests and wrote code to pass them, I noticed that some tests asking whether objects were instances of certain classes were passing when they shouldn't. For example, in an early build of the program my Printer class initialized with an instance of an Account on it. Despite not requiring my Account class in the Printer class file, all my RSpec tests still passed.

A little research yielded the answer: it seems that if you run all of your RSpec tests at once, RSpec requires all your classes and they become available to one another for the purposes of the tests. However, if you run a test individually on a class that does not require a necessary class, the test now returns the expected failure.

![printer test fail](https://github.com/CalumDarroch/bank-test/blob/master/img/Screenshot%202019-06-03%20at%2019.01.06.png)

Over time, the relationships between classes began to get messy. I refactored the Printer class to not have an Account as an attribute, and instead simply contain a method for printing that takes an array (of Transactions) as an argument. This allowed me to mock Transactions on it and test the Printer in isolation. I then applied the same approach to my Transaction class using dependency injection for the date.

### Technologies
