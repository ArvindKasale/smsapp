$(document).ready(function(){
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
})