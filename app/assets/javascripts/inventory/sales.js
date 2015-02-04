$(function () {
   var existenceinicial = parseInt($('#txtexistence').val())
   $("#txtquantity").keyup(function(event){

   	  if ($('#txtquantity').val() == "" || $('#txtquantity').val() == null ) {
        $('#txtamount').val("0");
        $('#txtexistence').val(existenceinicial);
   	  }else{
        amount   = 0;
        quantity = parseInt($('#txtquantity').val());
        price    = parseInt($('#txtprice').val());
        amount = price * quantity
        existence = existenceinicial - quantity
        $('#txtamount').val(amount)   	
        $('#txtexistence').val(existence)  	
   	  }

   });

});
