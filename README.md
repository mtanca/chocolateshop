### About the Program:

This project is written solely in Ruby. Ruby was chosen because it has an easy to read syntax and because the scope of the project did not call for a language oriented towards performance (it is a small and simple chocolate shop). Also, the robustness, simplicity, and readability of the rspec testing suite played a factor in my decision to use Ruby.

The program uses a controller class called **OrderController** that is designed to direct the flow of creating orders throughout the life-cycle of the program. The class method **.create_order_batch** instructs the program to receive an array of order objects from **OrderFileReader.read_csv**. **OrderController.create_order_batch** then maps over and updates each order with redemptions (if any) via **Order#redeem_wrappers**. Finally, **OrderController.create_order_batch** provides **OrderFileWriter.write** with the orders to be written to output/redemptions.csv.


### Execution and Testing:

The project relies on rake tasks for execution and testing. To run the program (assuming the gem bundler is installed), open the directory where the program is located and install dependencies:

**bundle install**

then type in the command:

**bundle exec rake run**

this will write the output of the program to 'output/redemptions.csv'.
To run rspec tests, type the command:

**bundle exec rake test**

this will display the results of all tests run. Note: test files write to an in-memory temp file rather than disk to avoid overwriting production data.


### Error in Test?

It is worth mentioning that there seems to be an error in the test. The directions state
"Given the data in input/orders.csv, a correct program will generate the following output:"

milk 7, dark 0, white 0, sugar free 1

**milk 0, dark 3, white 0, sugar free 0**

milk 0, dark 3, white 0, sugar free 5

milk 0, dark 1, white 5, sugar free 3

However, line two should only contain 2 dark chocolates. The data given for line two consists of a budget of $12, a cost of $6, and a redemption threshold of 4 wrappers. Therefore, the order should only contain two dark chocolates as the person buys 2 chocolates ($12 / $6) but has two less wrappers needed to qualify for the redemption. For the rspec test, I changed the number of dark chocolates from 3 to 2 in order to test for correct quantities.  
