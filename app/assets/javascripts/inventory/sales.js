$(function () {
   
   $("#txtquantity").keyup(function(event){

   	  if ($('#txtquantity').val() == "" || $('#txtquantity').val() == null ) {
        $('#txtamount').val("0");    
   	  }else{
        amount   = 0;
        quantity = parseInt($('#txtquantity').val());
        price    = parseInt($('#txtprice').val());
        amount = price * quantity
        $('#txtamount').val(amount)   	  	
   	  }

   });

});
