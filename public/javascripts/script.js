$(document).ready(function(){
$('.string').keyup(function(){
	if((this.id).split("_").pop()!="email")
	{
		this.value = this.value.toUpperCase();
	}
});
$('.text ').keyup(function(){
		this.value = this.value.toUpperCase();
	
});

/*To avoid small-cased data from field history*/
/*$('.string').focusout(function(){
	this.value=this.value.toUpperCase();
});
*/
})