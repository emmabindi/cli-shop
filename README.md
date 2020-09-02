**Running Instructions:**

```
git clone this repo
$ gem install tty-prompt json
$ ruby shop.rb
```

_To load a new product list:_

- Load your product data into a json file named "products.json" and save at root of project folder (existing file is here already)

---

### Command Line Application: Ruby

#### Required Functionality:

- Load a list of products from a file.
- List product details to the user.
- Add products to a Shopping Cart.
- Apply promotional discounts.
- Calculate and display the total cost.

#### Design Methodology

- DRY code principles
- Concise & meaningful method names
- Modularised methods (Shopping Cart actions separated)
- Product Class utilised to create all shop product objects
- Testing of app functionality through extensive manual testing
- RSPEC testing of product class
