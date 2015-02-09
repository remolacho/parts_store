$(function () {
   
   $("#psload").hide();
   
   $("#formSearchDC").submit(function(){
      $('#dailyclosures').html("");
      $("#psload").show();
   });

});