$(document).ready(function(){
	

if($("#order_status").val()=="Order Placed")
{
	
	placedOrder();
}
else if($("#order_status").val()=="Order Received")
{
	
	receivedOrder();
}	
/*	
	$(".order_date_received").children().attr("disabled","disabled");
	$("#order_quantity_received").attr("disabled","disabled");
	$(".order_date_received").hide();
	$(".order_quantity_received").hide();
*/	
$('.string').keyup(function(){
	var email=(this.id).split("_");
	var length=email.length
	var email2=email[length-1];	
	var email1=email[length-2]
	var emailId=email1+"_"+email2
	//alert(emailId);
	
	if((this.id).split("_").pop()!="email")
	{
		if(emailId!="email_2")
		{
		this.value = this.value.toUpperCase();
		}
	}
});

$('.text ').keyup(function(){
		this.value = this.value.toUpperCase();
	
});

$('.string').focusout(function(){
	if((this.id).split(_).pop()=="pincode")
	{
		//alert("In pincode");
	}
	
});



/*To avoid small-cased data from field history*/
/*$('.string').focusout(function(){
	this.value=this.value.toUpperCase();
});
*/




$("#order_status").change(function(){
	if($(this).val()=="Order Placed")
	{
		placedOrder();
		
	}
	else
	{
		receivedOrder();
	}
	});
 

})

function placedOrder(){
	$(".order_date_placed").show();
		$(".order_quantity_placed").show();
		$(".order_date_placed").children().removeAttr("disabled");
		$(".order_date_received").children().val("");
		$(".order_date_received").children().attr("disabled","disabled");
		$("#order_quantity_received").attr("disabled","disabled");
		$("#order_quantity_received").val("");
		$(".order_date_received").hide();
		//$(".order_date_received").attr("disabled");
		$("#order_quantity_placed").removeAttr("disabled");
		$(".order_quantity_received").hide();
}
function receivedOrder()
{
	$(".order_date_placed").children().attr("disabled","disabled");
		$(".order_date_placed").children().val("");
		$("#order_quantity_placed").attr("disabled","disabled");
		$("#order_quantity_placed").val("");
		$("#order_quantity_received").removeAttr("disabled");
		$(".order_date_placed").hide();
		$(".order_quantity_placed").hide();
		$(".order_date_received").show();
		$(".order_quantity_received").show();
		$(".order_date_received").children().removeAttr("disabled");
}
