// External file with functions to Order page by Joanna Goch.

// ----------------------------------------
// order management
// ----------------------------------------

var order_content = []

function AddSelectionToOrder()
{
    // get the data via DOM
    var selection_element = document.getElementById("menu_items");
    var sizeName = selection_element.value
    var quantity = document.getElementById("item_quantity").value;
    order_item = CreateOrderItem(sizeName, quantity);
    order_content.push(order_item);
    UpdateOrderTable();
    UpdateTotalDisplay();
}

function UpdateOrderTable()
{
    var table = document.getElementById("order_table");
    
    // remove existing table content
    while(table.rows.length > 1) 
    {
        table.deleteRow(1);
    }

    // write table content from scratch
    for(var i = 0; i<order_content.length; i++)
    {
        row = table.insertRow(table.length);
        row.className="order_item"
        row.insertCell().innerHTML = order_content[i].quantity + " x";
        row.insertCell().innerHTML = order_content[i].size_name;
        row.insertCell().innerHTML = order_content[i].price_per_item.toFixed(2) + " &euro;";
        row.insertCell().innerHTML = order_content[i].price_total.toFixed(2) + " &euro;";
        row.insertCell().innerHTML = '<button type="button" class="add_button" onclick="RemoveItem(' + i + ')"> X </button>';
    }    
}

// to update the list table after some item was clicked to remove.
function RemoveItem(index)
{
    order_content.splice(index, 1);
    UpdateOrderTable();
    UpdateTotalDisplay();
}

function UpdateTotalDisplay()
{
    // sum without discount
    var sum = GetOrderTotal();
    var sum_element = document.getElementById("order_sum_display");
    sum_element.innerHTML = sum.toFixed(2) + " &euro;";

    // Total with discount accounted for
    var total = GetOrderTotal() * GetDiscountFactor();
    var total_element = document.getElementById("order_total");
    total_element.innerHTML = total.toFixed(2) + " &euro;";
}

// to set elements for pick up menu -at start they are black and giving options to choose.
function CreateOrderItem(sizeName, quantity)
{
    var order_item = 
    {
        size_name: "",
        quantity: 0,
        price_per_item: 0,
        price_total: 0
    };

    // Define data for burrito size and prices
    order_item.size_name = sizeName;
    order_item.quantity = quantity;

    if(sizeName === "Large")
    {
        order_item.price_per_item = 5;
    }
    else if(sizeName === "Extra-Large")
    {
        order_item.price_per_item = 7.5;
    }
    else if(sizeName === "Supersize")
    {
        order_item.price_per_item = 17;
    }
    order_item.price_total = order_item.price_per_item * quantity;
    return order_item;
}

// To calculate and return total price for picked items.
function GetOrderTotal()
{
    var total = 0.0;
    for(var i = 0; i < order_content.length; i++)
    {
        total = total + order_content[i].price_total;
    }
    return total;
}

// To allow implement a discount code of 13.5% of total price
function GetDiscountFactor()
{
    var discount = 1.0;
    var voucher_element = document.getElementById("voucher");
    var voucher_code = voucher_element.value;
    if(voucher_code === "mextexgood")
    {
        discount = 0.865;
    }
    return discount;
}



// ----------------------------------------
// form management
// ----------------------------------------

// Validation alert about login prior order complition
function ConfirmSelection()
{
    alert("Please login to complete your order");
}

// Validation alert for inputed discound code -2 possibilites depending on if voucher is correct.
function ValidateVoucher()
{
    var factor = GetDiscountFactor();
    if(factor < 1.0)
    {
        alert("Voucher code is applied!");
        UpdateTotalDisplay();
    }
    else
    {
        alert("Voucher code is not correct!");
        UpdateTotalDisplay();
    }
}


// To condition password length 11 characters + user name for at least 3 characters to enable a submit order option and button.
function OkToEnableSubmitButton()
{
    var isNotOK = true;

    var user_name = document.getElementById("user_name").value;
    var password = document.getElementById("password").value;
    var email = document.getElementById("email").value;

    if( order_content.length > 0 && user_name.length > 2 && password.length == 11 )
    {
        isNotOK = false;
    }
    
    document.getElementById("submit_order").disabled = isNotOK;
    
// Additional hint display (disable vs. enable) for user about password and user name condition
    if(password.length == 11)
    {
        document.getElementById("hint_password").style.display = "none";
    }
    else
    {
        document.getElementById("hint_password").style.display = "";
    }

    if(user_name.length > 2)
    {
        document.getElementById("hint_username").style.display = "none";
    }
    else
    {
        document.getElementById("hint_username").style.display = "";
    }
    if(email.length > 5 && email.includes("@") && email.includes(".") && email.endsWith(".") == false)
    {
        document.getElementById("hint_email").style.display = "none";
    }
    else
    {
        document.getElementById("hint_email").style.display = "";
    }    
}

function SizeSelectionChanged(doReset)
{
    // get the data via DOM
    var selection_element = document.getElementById("menu_items");
    var sizeName = selection_element.value
    var quantity = document.getElementById("item_quantity").value;
    order_item = CreateOrderItem(sizeName, quantity)

    // adjust HTML/UI // Additional warning display for one size only (Supersize)
    document.getElementById("item_price").innerHTML = "Price: " + order_item.price_total + " EUR";    
    if(sizeName === "Supersize") 
    // with little jQuery effect on CSS element
    {
        $("#warning").animate
        (
            {opacity: 1.5,}
        );
    }
    else
    {
        $("#warning").animate
        (
            {opacity: 0.0,}
        );
        //document.getElementById("warning").innerHTML="";
    }

    // To disable or enable the 'ADD' button based on the drop down
    var add_button = document.getElementById("add_selection");
    if(sizeName === "None")
    {
        add_button.disabled = true;
    }
    else
    {
        add_button.disabled = false;
    }

    // reset quantity after changing size
    if(doReset == true)
    {
        var number_field = document.getElementById("item_quantity");
        number_field.value = 1;
    }
}

// After user submit order can click on alert popped out - yes or not to confirm- that displays msg accordingly.
function OrderConfirm() 
{
    if (confirm("Click the button to process or cancel your order.") == true)
    {
        document.write ("Hurrey! Order confirmed.  ", "Your burrito will be ready shortly! :) "); 
    }  
    else
    {
        document.write ("Order canceled. ", "Go back to menu. "); 
    } 
}


// -------------------------------------------------------------
