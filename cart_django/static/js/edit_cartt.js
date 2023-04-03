let left_button = (product_id) => {
    let input = document.getElementById('number'+product_id)
    let value = input.getAttribute("value");
    let right_button = document.getElementById("right_button"+product_id);
    let left_button = document.getElementById("left_button"+product_id);
    right_button.classList.remove("not-allowed");
    value = parseInt(value)
    value <= 1 ? value=1 : value --;
    value == 1 ? left_button.classList.add("not-allowed") : 0;
    input.setAttribute("value", value);
}
let right_button = (product_id) => {
    let input = document.getElementById('number'+product_id)
    let max_value = input.getAttribute("max-value");
    let value = input.getAttribute("value");
    let right_button = document.getElementById("right_button"+product_id);
    let left_button = document.getElementById("left_button"+product_id);
    left_button.classList.remove("not-allowed");
    value = parseInt(value)
    value < max_value ? value++ : 0;
    value == max_value ? right_button.classList.add("not-allowed") : 0;
    input.setAttribute("value", value);
}

let order_view = (url_action) => {
    let checkboxes = document.querySelectorAll('input[name="select_product"]:checked');
    let values = [];
    checkboxes.forEach((checkbox) => {
        values.push(checkbox.value);
    });
    console.log(values)
    array_data = []
    values.forEach((values) => {
        let number = document.getElementById('number'+values)
        array_data.push({
            'cart_product_id': values,
            'number': number.value 
        })
    });
    var payload = JSON.stringify(array_data);
    console.log(payload)
    $.ajax({
        url : url_action,
        type: "POST",
        data : payload,
        dataType : "json",
    }).done(function(data){
        console.log(data);
        window.location.href = "order_view_temp" ;
    });
}