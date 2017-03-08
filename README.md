### About the Program:

This project is written solely in Ruby. Ruby was chosen because it has an easy to read syntax and because the scope of the project did not call for a language oriented towards performance (it is a small and simple chocolate shop). Also, the robustness, simplicity, and readability of the rspec testing suite played a factor in my decision to use Ruby.

The program uses a controller class called **OrderController** that is designed to direct the flow of creating orders throughout the life-cycle of the program. The class method **.create_order_batch** instructs the program to receive an array of order objects from **OrderFileReader.read_csv**. **OrderController.create_order_batch** then maps over and updates each order with redemptions (if any) via **Order#redeem_wrappers**. Finally, **OrderController.create_order_batch** provides **OrderFileWriter.write** with the orders to be written to output/redemptions.csv.

When creating the program, there were a few difficult design decisions I had to make. In the **Order** class, I use hashes to track the quantity of both the wrappers redeemed for each chocolate and the amount of each chocolate type in the order. While refactoring my first iteration, it seemed to be that the **Order** class was a bit primitive heavy, which indicated to me that a better abstraction for the hashes being used to track wrapper and cart items may exist (in this case making a Wrappers class and a Cart class). I decided to refactored the hashes into their own classes so that instances of each object could be used at the time the **Order** became instantiated. Ultimately, I decided to go back to my original iteration using hashes because classes did not have unique behavior and were essentially used to only track state.

Another difficult design decision I made was when and where to format the data as a string so orders could be written disk by **OrderFileWriter#write**. At first, I created some formatting methods and added them to the **OrderFileWriter** class. However, this was a big code smell. **OrderFileWriter** should not have to know how or what is being written, have the additional behavior within **OrderFileWriter** .      


### Execution and Testing:

The project relies on rake tasks for execution and testing. To run the program (assuming the gem bundler is installed), open the directory where the program is located and install dependencies:

**bundle install**

then type in the command:

**bundle exec rake run**

this will write the output of the program to 'output/redemptions.csv'.
To run rspec tests, type the command:

**bundle exec rake test**

this will display the results of all tests run. Note: test files write to an in-memory temp file rather than disk to avoid overwriting production data.

Please also note that these two commands also load the required files from the environment rake task to make the program work. As a result they must be used to run and test the program.
