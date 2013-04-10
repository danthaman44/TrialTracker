// This is a manifest file that'll be compiled into including all the files listed below.
// Add new JavaScript/Coffee code in separate files in this directory and they'll automatically
// be included in the compiled file accessible from http://example.com/assets/application.js
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// the compiled file.
//
//=require jquery
//=require jquery_ujs
//=require bootstrap
//=require_tree .


$(document).ready(function(){
	console.log('testing');
	$('.delete_post').bind('ajax:success', function() {  
	    $(this).closest('tr').fadeOut();  
	    return false;
	});  


	// $('#update').click(function() {
	// 	var forceGet = true;
	// 	location.reload(forceGet);
	// 	return true;
	// //   var r = confirm("Are you sure? If you already have an entry for today, it will be overridden.");
	// //   if (r==true)
	// //   {
	// //   return true;
	// //   }
	// // else
	// //   {
	// //   return false;
	// //   }
	// //   return false;
 //    });  

});

