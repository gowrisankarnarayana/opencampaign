<div id="customFields"> 
<input class="btn" type="button"  onclick="jInsertField('Field:FirstName')" 	 value="First Name"/>
<input class="btn" type="button"  onclick="jInsertField('Field:LastName')" 		 value="Last Name"/>
<input class="btn" type="button"  onclick="jInsertField('Field:Email')" 		 value="Email Address"/>
<input class="btn" type="button"  onclick="jInsertField('Field:Mobile')" 		 value="Mobile Number"/>
<input class="btn" type="button"  onclick="jInsertField('Field:LandPhone')" 	 value="Land Phone"/>
<input class="btn" type="button"  onclick="jInsertField('Field:ContactDetails')" value="Contact Details"/>
</div>
<script> 
	$(function(){ 
		$("#customFields").dialog({modal: false,width:200,height:500,autoOpen: false,title: 'Custom Fields'});
		$(".btn").button(); 
	}); 
	function jInsertField(strFieldVal){
		var objEditor = CKEDITOR.instances["htmlEditor"];
		objEditor.insertHtml(strFieldVal);
	}
	function showCFields(){
		$("#customFields").dialog("open");
	}
</script>