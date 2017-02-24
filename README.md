General Questions:

* Order#redeem_wrappers- wrappers are being redeemed recursively. Is there a more ruby-esque way of doing it?

* How concerned should I really be about performance? (using attr_reader vs. @IV)

* Order CHOCOLATES makes code look nicer but takes up extra space in memory (trade-off: performance vs. readability)

* I keep extracting out IV as attrs to make testing easier. (Example: OrderController#initialize) Thoughts? Feels like I'm writing crappy code by doing this...

* OrderController#initialize- is there a problem w/ me getting the batch from orders here? Best practices??

* InputFile#read_csv- I keep mutating state of 'output_string' to create the order batch. Is this bad practice?

* Is it okay to spec_helper? Using it to format spec output/add --format documentation as option
