$(function () {
   var existenceinicial = parseInt($('#txtexistence').val())
   $("#txtquantity").keyup(function(event){

   	  if ($('#txtquantity').val() == "" || $('#txtquantity').val() == null ) {
        $('#txtamount').val("0");
        $('#txtexistence').val(existenceinicial);
   	  }else{
        
        amount   = 0;
        amount_cost = 0;
        
        quantity = parseInt($('#txtquantity').val());
        price    = parseInt($('#txtprice').val());
        price_cost = parseInt($('#txtcostprice').val());
        
        amount = price * quantity
        amount_cost = price_cost * quantity
        existence = existenceinicial - quantity
        
        $('#txtamount').val(amount) 
        $('#txtamountcost').val(amount_cost)   	
        $('#txtexistence').val(existence) 

   	  }

   });

});
