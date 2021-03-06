# Takeaway Challenge

```
                            _________
              r==           |       |
           _  //            |  W.H. |   ))))
          |_)//(''''':      |       |
            //  \_____:_____.-------D     )))))
           //   | ===  |   /        \
       .:'//.   \ \=|   \ /  .:'':./    )))))
      :' // ':   \ \ ''..'--:'-.. ':
      '. '' .'    \:.....:--'.-'' .'
       ':..:'                ':..:'

 ```
## Tests

To run Feature and Unit tests run script:
./tdd.test

## Feature Tests

To test all User Stories run script:
./tdd.feature-test

Script will pause after each story, press Control-C to continue.

To feature test an individual object run:
./tdd.feature-test object-name

For example:
./tdd.feature-test order

## Unit Tests

To test all Unit Tests and run rubocop, run script:
./tdd.unit-test

To unit test an individual object run:
./tdd.unit-test object-name

For example:
./tdd.unit-test order


## Model

* A Dish has a unique identifier (number), a price and a description
* A Menu consists of a number of Dishes
* A Restaurant has a Menu and can take Orders
* A Order is a selection of Dishes
* A Customer can view all Dishes in a Menu
* A Customer can create an Order
* A Customer can ask when their Order will arrive
* A TextMessage contains a message
* A Text Message will be sent by the Restaurant to the Customer to tell them when their Order will be ready

## Classes

### Key
:x: = Not implemented, fails tests  
:negative_squared_cross_mark: = Partial implementation, passes tests  
:white_check_mark: = Full implemented, passes tests  

| ```Status```       |  ```Class```      | ```Notes``` |
|:--:                |                --:|:--          |
| :x:                | ```Customer```    | Container for everything about the Customer |
| :x:                | ```Restaurant```  | Container for everything about the Restaurant |
| :negative_squared_cross_mark: | ```Menu```        | Holds list of dishes with prices |
| :white_check_mark: | ```Dish```        | Holds everything about a dish |
| :negative_squared_cross_mark: | ```Order```       | Holds everything about an order |
| :negative_squared_cross_mark: | ```TextMessage``` | Handles everything related to sending and receiving text messages |

## Methods

| ```Status```       |  ```Class```      | ```Method```           | ```Notes``` |
|:--:                |                --:|:--                     |:--          |
| :white_check_mark: | ```Dish```        | ```new(number, price, name)``` |  |
| :white_check_mark: | ```Dish```        | ```number``` | Returns the number |
| :white_check_mark: | ```Dish```        | ```price``` | Returns the price |
| :white_check_mark: | ```Dish```        | ```name``` | Returns the name |
| :white_check_mark: | ```Menu```        | ```new``` |  |
| :white_check_mark: | ```Menu```        | ```add(dish)``` | Each dish.number must be unique |
| :x:                | ```Menu```        | ```remove(dish)``` | Not implemented currently |
| :white_check_mark: | ```Menu```        | ```get(number)``` | Returns Dish corresponding to Dish.number |
| :white_check_mark: | ```Menu```        | ```dishes``` | Returns all dishes |
| :white_check_mark: | ```Menu```        | ```include?(dish)``` | Private, returns true if dish has been added |
| :white_check_mark: | ```Order```       | ```new``` |  |
| :white_check_mark: | ```Order```       | ```add(number, menu)``` | Checks number is on the menu before adding |
| :x:                | ```Order```       | ```remove(number)``` | Not implemented currently |
| :white_check_mark: | ```Order```       | ```total``` |  |
| :white_check_mark: | ```Order```       | ```order``` | Returns array containing dish numbers |
| :white_check_mark: | ```Order```       | ```time``` | Returns time of last change to order |
| :white_check_mark: | ```TextMessage``` | ```new``` |  |
| :negative_squared_cross_mark: | ```TextMessage``` | ```send_message(order)``` | Doesn't use API to send message currently |
| :x:                | ```Restaurant```  | ```new``` |  |
| :x:                | ```Restaurant```  | ```create_menu``` |  |
| :x:                | ```Restaurant```  | ```receive(order)``` |  |
| :x:                | ```Restaurant```  | ```add(menu, dish)``` |  |
| :x:                | ```Restaurant```  | ```remove(menu, dish)``` |  |
| :x:                | ```Customer```    | ```new``` |  |
| :x:                | ```Customer```    | ```read_menu``` |  |
| :x:                | ```Customer```    | ```create_order``` |  |
| :x:                | ```Customer```    | ```add(order, dish)``` |  |
| :x:                | ```Customer```    | ```remove(order, dish)``` |  |
| :x:                | ```Customer```    | ```total(order)``` |  |






## Improvements

* Dish could probably just be a Hash
* Dish price would be more efficient as an Integer represented in pence, but presented as a two decimal place Float
* Dish could have a description as well as a name
* Implement Menu.remove(dish) method
* Implement Order.remove(number) method
* Add Order number unique identifier to Order (and send with TextMessage)
* Add Orders Class to hold all Orders



# Original README

Instructions
-------

* Challenge time: rest of the day and weekend, until Monday 9am
* Feel free to use google, your notes, books, etc. but work on your own
* If you refer to the solution of another coach or student, please put a link to that in your README
* If you have a partial solution, **still check in a partial solution**
* You must submit a pull request to this repo with your code by 9am Monday morning

Task
-----

* Fork this repo
* Run the command 'bundle' in the project directory to ensure you have all the gems
* Write a Takeaway program with the following user stories:

```
As a customer
So that I can check if I want to order something
I would like to see a list of dishes with prices

As a customer
So that I can order the meal I want
I would like to be able to select some number of several available dishes

As a customer
So that I can verify that my order is correct
I would like to check that the total I have been given matches the sum of the various dishes in my order

As a customer
So that I am reassured that my order will be delivered on time
I would like to receive a text such as "Thank you! Your order was placed and will be delivered before 18:52" after I have ordered
```

* Hints on functionality to implement:
  * Ensure you have a list of dishes with prices
  * Place the order by giving the list of dishes, their quantities and a number that should be the exact total. If the sum is not correct the method should raise an error, otherwise the customer is sent a text saying that the order was placed successfully and that it will be delivered 1 hour from now, e.g. "Thank you! Your order was placed and will be delivered before 18:52".
  * The text sending functionality should be implemented using Twilio API. You'll need to register for it. It’s free.
  * Use the twilio-ruby gem to access the API
  * Use the Gemfile to manage your gems
  * Make sure that your Takeaway is thoroughly tested and that you use mocks and/or stubs, as necessary to not to send texts when your tests are run
  * However, if your Takeaway is loaded into IRB and the order is placed, the text should actually be sent
  * Note that you can only send texts in the same country as you have your account. I.e. if you have a UK account you can only send to UK numbers.

* Advanced! (have a go if you're feeling adventurous):
  * Implement the ability to place orders via text message.

* A free account on Twilio will only allow you to send texts to "verified" numbers. Use your mobile phone number, don't worry about the customer's mobile phone.

> :warning: **WARNING:** think twice before you push your **mobile number** or **Twilio API Key** to a public space like GitHub :eyes:
>
> :key: Now is a great time to think about security and how you can keep your private information secret. You might want to explore environment variables.

* Finally submit a pull request before Monday at 9am with your solution or partial solution.  However much or little amount of code you wrote please please please submit a pull request before Monday at 9am


In code review we'll be hoping to see:

* All tests passing
* High [Test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) (>95% is good)
* The code is elegant: every class has a clear responsibility, methods are short etc.

Reviewers will potentially be using this [code review rubric](docs/review.md).  Referring to this rubric in advance will make the challenge somewhat easier.  You should be the judge of how much challenge you want this weekend.

Notes on Test Coverage
------------------

You can see your [test coverage](https://github.com/makersacademy/course/blob/master/pills/test_coverage.md) when you run your tests.
