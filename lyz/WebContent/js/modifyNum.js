$(document).ready(function() {
		
	$("#min").on('click',function(){
		var count = parseInt($("#text_box").val());
//		var stock = parseInt($("#item_stock").val());
		if (count>1) {
			count = count-1;
		
			$(this).attr("disabled",false);
		} else{
			$("#min").attr("disabled",true);
		}
	});
		
	$("#add").on('click',function(){
		
		var count = parseInt($("#text_box").val());
		var stock = parseInt($("#item_stock").val());
		if (stock<=count) {
			$(this).attr("disabled",true);
		} else{
			count = count+1;
			$(this).attr("disabled",false);
		}
	});
	
	$("#text_box").on('change',function(e){
		var input_count = parseInt(e.delegateTarget.value);
		var stock = parseInt($("#item_stock").val());
		if (input_count>stock) {
			//input_count = stock;
			alert("超出库存量了！");
			return;
		} 
		$("#text_box").val(input_count);
		
	});
});