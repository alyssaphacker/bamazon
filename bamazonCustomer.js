const mysql = require("mysql");
const inquirer = require("inquirer");
const connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "password",
  database: "bamazonDB"
});
///////////////////////////////////////////////////////////////
connection.connect(err => {
  if (err) throw err;
  console.log("connected as id " + connection.threadId + "\n");

  startDisplay();

});
////////////////////////////////////////////////////////////////

function startDisplay() {
  console.log("Selecting all products...\n");
  connection.query("SELECT * FROM products", (err, res) => {
    if (err) throw err;
   	console.table(res);
	questions();
  });
}

function questions(){
 inquirer
    .prompt([
	{
      name: "id",
      type: "input",
      message: "Type the id of the item you would like to purchase ?",
    },
	{
	  name: "quantity",
	  type: "input",
	  message: "Type the number of units you want to purchase:"
	}])
    .then( (answer) => {
		 
		console.log(answer);
		purchase(answer.id, answer.quantity);
		
	})
}

function purchase(id, quantity){
	connection.query("SELECT * FROM products WHERE item_id="+id,
		(err, res) => {
			var diff = parseInt(res[0].stock_quantity) - parseInt(quantity)
			if(diff >= 0){
				updateProduct(id, diff);
			}	
		})
}


function createProduct() {
  console.log("Inserting a new product...\n");
  var query = connection.query(
    "INSERT INTO products SET ?",
    {
      product_name: "rocky road ice cream",
      department_name: "groceries",
      price: 5.29,
	  stock_quantity: 50
    },
    (err, res) => {
      console.log(res.affectedRows + " product inserted!\n");
    }
  );

//  console.log(query.sql); logs actual query command

}

function updateProduct(id, quantity) {
  var query = connection.query(
    "UPDATE products SET ? WHERE ?",
    [
      {
        stock_quantity: quantity
      },
      {
        item_id: id
      }
    ],
    (err, res) => {
      console.log(res.affectedRows + " products updated!\n");
    }
  );

  // logs the actual query being run
  console.log(query.sql);
}

