$(function () {
   
   $("#load").hide();
   $("#formSearch").hide();
   
   $("#formSearchItem").submit(function(){
      $('#items').html("");
      $("#load").show();
   });

  $("#filterItem").click(function(){
      $("#formSearch").toggle("slow");
   });

});
