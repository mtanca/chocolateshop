### About the Program:

This project is written solely in Ruby. Ruby was chosen because it has an easy to read syntax and because the scope of the project did not call for a language oriented towards performance (it is a small and simple chocolate shop). Also, the robustness, simplicity, and readability of the rspec testing suite played a factor in my decision to use Ruby.

The program uses a controller class called **OrderController** that is designed to direct the flow of creating orders throughout the life-cycle of the program. This is used instead of a chocolate shop class because I felt the project scope focuses specifically on the creation of orders and not the additional behaviors a chocolate shop class should have. The instance method **#create_order_batch** instructs the program to receive an array of order objects from **OrderFileReader#read_orders**. **OrderController#create_order_batch** then maps over and updates each order with redemptions (if any) via **Order#redeem_wrappers**. Finally, each order is then formatted so that **OrderFileWriter#write** can write the orders to output/redemptions.csv.


### Design Challenges and Decisions:

When creating the program, there were a few difficult design decisions I had to make. For example, in the **Order** class I decided to use hashes to track the quantity of both the wrappers redeemed for each chocolate and the amount of each chocolate in each order. My initial concern with using hashes in the class was that it seemed to make **Order** a bit primitive heavy. This indicated to me that a better abstraction may exist for the hashes such as a wrappers and cart class. Ultimately, I decided to use the hashes instead of creating classes because I could not justify creating classes which only had state and no unique behavior.

Another difficult design decision I made was when and where to format the data so that the orders could be written disk by **OrderFileWriter#write**. Initially, I thought formatting the data in **Order** or **OrderFileWriter** would be appropriate. However, I felt it could easily be argued that adding formatting behavior to either class would be outside the scope of expected behavior in either class. I felt as if **Order** should only be responsible for calculating the chocolate quantities of each order and that **OrderFileWriter** should not know or care what format the data is in (it should only know how to write). For this reason, I decided to create a **Format** class that acts as an interface between getting an order and writing an order. This way, the applications has a class that has the sole responsibility of formatting orders in the application. I believe this design also makes it easier to extend **Format** for other possible formatting needs without creating or altering expected behavior of any other classes.


### Execution and Testing:

The project relies on rake tasks for execution and testing. To run the program (assuming the gem bundler is installed), open the directory where the program is located and install dependencies:

```
$ bundle install
```

then type in the command:

```
$ bundle exec rake run
```

this will write the output of the program to 'output/redemptions.csv'.
To run rspec tests, type the command:

```
$ bundle exec rake test
```

this will display the results of all the tests. Note: test files write to an in-memory temp file rather than disk to avoid overwriting production data.

Please note that these two commands also load the required files from the environment rake task to make the program work. As a result they must be used to run and test the program.

### Final Thoughts:

The application design is largely influenced and S.O.L.I.D principles and TDD. Though not perfect, I believe the application is sturdy enough be able to withstand changes without the entire application breaking. I also I want to give a quick shout-out to Sandy Metz materials that were linked as references in the test documentation. Her code examples are amazing!    
