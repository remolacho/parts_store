$(function () {
   
   $("#psload").hide();
   $("#formSearch").hide();
   
   $("#formSearchItem").submit(function(){
      $('#items').html("");
      $("#psload").show();
   });

  $("#filterItem").click(function(){
      $("#formSearch").toggle("slow");
   });

});
