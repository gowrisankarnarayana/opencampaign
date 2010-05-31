<%@taglib prefix="j" uri="http://joompal.com/beyondcontact/ui-tags" %>
<%@taglib prefix="html"  uri="http://joompal.com/beyondcontact/struts-html" %>
<%@page import="com.beyond.constants.*" %>
<j:Window display="none" title="When do you want it to be delivered" id="DIV_SCHEDULE_DELIVERY">
          
       <div id="tabs-1">
       		<div class="demo">
        		<div id="radio" >
        		    <html:radio styleId="radio4" value="<%=String.valueOf(MailConstants.SEND_ONCE)%>"    property="mailScheduleVO.deliveryPatternId"  onclick="javascript:viewPattern('Once')"   /> <label for="radio4">Just Once</label>
        			<html:radio styleId="radio1" value="<%=String.valueOf(MailConstants.SEND_DAILY)%>"   property="mailScheduleVO.deliveryPatternId"  onclick="javascript:viewPattern('Daily')"   /><label for="radio1">Every Day</label>
					<html:radio styleId="radio2" value="<%=String.valueOf(MailConstants.SEND_WEEKLY)%>"  property="mailScheduleVO.deliveryPatternId"  onclick="javascript:viewPattern('Weekly')"  /><label for="radio2">Every Week</label>
					<html:radio styleId="radio3" value="<%=String.valueOf(MailConstants.SEND_MONTHLY)%>" property="mailScheduleVO.deliveryPatternId"  onclick="javascript:viewPattern('Monthly')" /><label for="radio3">Every Month</label>
				</div>
        		<div style='margin:4px'>
	        		<table><tr><td valign='top'>
	        		<fieldset class="jFieldSet"><legend>Date and Time</legend>
	        			<table>
	        			<tr><td colspan='2'>
							<label id='lblFrm' for="from">From</label> 
							<html:text  property="mailScheduleVO.startDate"  styleId="from" /> 
							<span id='spnTo'>
							<label for="to">to</label> 
							<html:text  property="mailScheduleVO.endDate"  styleId="to" />
							</span>
				 		</td></tr>
				 		<tr><td colspan='2'>
						<label for="hours">Time </label> 
							<html:select styleId="hours" property="mailScheduleVO.sendHours">
								<option value='1'>01:00</option>
								<option value='2'>02:00</option>
								<option value='3'>03:00</option>
								<option value='4'>04:00</option>
								<option value='5'>05:00</option>
								<option value='6'>06:00</option>
								<option value='7'>07:00</option>
								<option value='8'>08:00</option>
								<option value='9'>09:00</option>
								<option value='10'>10:00</option>
								<option value='11'>11:00</option>
								<option value='12'>12:00</option>
							</html:select>
							<html:select styleId="hours" property="mailScheduleVO.sendMinutes">
								<option selected value='0'>00:00</option>
								<option value='15'>15:00</option>
								<option value='30'>30:00</option>
								<option value='45'>45:00</option>
							</html:select>
							<html:select styleId="hours" property="mailScheduleVO.sendAmPm">
								<option selected value='1'>AM</option>
								<option value='2'>PM</option>
							</html:select>
				 		</td></tr>
						<tr><td>&nbsp;</td><td> 
							<div>
							<html:checkbox styleId="excludeHolidays" property="mailScheduleVO.excludeHolidays"/>
							<label class='l' for="excludeHolidays">Exclude public holidays</label>
							</div>
							<div>
							<html:checkbox styleId="autoRoll"  property="mailScheduleVO.autoRoll"/>
							<label class='l' for="autoRoll">Auto roll delivery to next working day</label>
							</div>
						</td></tr>												
						</table>
				</fieldset>
				</td><td valign='top'>
				<div id="divDaily" style="display:none">
				<fieldset class="jFieldSet"><legend>Do you want to exclude any days?</legend>
	        			<table>
						<tr><td><html:checkbox  styleId="chkMon"  property="mailScheduleVO.daysExcluded" value="1"></html:checkbox><label for="chkMon">Monday</label>	</td></tr>
						<tr><td><html:checkbox  styleId="chkTue"  property="mailScheduleVO.daysExcluded" value="2"></html:checkbox><label for="chkTue">Tuesday</label></td></tr>
						<tr><td><html:checkbox  styleId="chkWed"  property="mailScheduleVO.daysExcluded" value="3"></html:checkbox><label for="chkWed">Wednesday</label></td></tr>
						<tr><td><html:checkbox  styleId="chkThu"  property="mailScheduleVO.daysExcluded" value="4"></html:checkbox><label for="chkThu">Thursday</label></td></tr>
						<tr><td><html:checkbox  styleId="chkFri"  property="mailScheduleVO.daysExcluded" value="5"></html:checkbox><label for="chkFri">Friday</label></td></tr>
						<tr><td><html:checkbox  styleId="chkSat"  property="mailScheduleVO.daysExcluded" value="6"></html:checkbox><label for="chkSat">Saturday</label></td></tr>
						<tr><td><html:checkbox  styleId="chkSun"  property="mailScheduleVO.daysExcluded" value="7"></html:checkbox><label for="chkSun">Sunday</label></td></tr>
						</table>
				</fieldset>
				</div>
				<div id="divWeekly" style="display:none">
				<fieldset class="jFieldSet"><legend>Choose a weekday you wish to deliver</legend>
						<table>
						<tr><td><html:radio styleId="optMon" property="mailScheduleVO.dayOfWeek"  value="1"></html:radio><label for="optMon">Monday</label>	</td></tr>
						<tr><td><html:radio styleId="optTue" property="mailScheduleVO.dayOfWeek"  value="2"></html:radio><label for="optTue">Tuesday</label></td></tr>
						<tr><td><html:radio styleId="optWed" property="mailScheduleVO.dayOfWeek"  value="3"></html:radio><label for="optWed">Wednesday</label></td></tr>
						<tr><td><html:radio styleId="optThu" property="mailScheduleVO.dayOfWeek"  value="4"></html:radio><label for="optThu">Thursday</label></td></tr>
						<tr><td><html:radio styleId="optFri" property="mailScheduleVO.dayOfWeek"  value="5"></html:radio><label for="optFri">Friday</label></td></tr>
						<tr><td><html:radio styleId="optSat" property="mailScheduleVO.dayOfWeek"  value="6"></html:radio><label for="optSat">Saturday</label></td></tr>
						<tr><td><html:radio styleId="optSun" property="mailScheduleVO.dayOfWeek"  value="7"></html:radio><label for="optSun">Sunday</label></td></tr>
						</table>
				</fieldset>
				</div>
				<div id="divMonthly" style="display:none">
				<fieldset class="jFieldSet"><legend>Enter a day of month</legend>
						<table>
						<tr><td><html:text styleId="txtMonthDay" property="mailScheduleVO.dateOfMonth" /><label for="txtMonthDay">Day Of Month (1 To 31)</label></td></tr>
						</table>
				</fieldset>
				</div>
				</td></tr>
				</table> 
				</div>
			</div>
        </div> 
</j:Window>
<script type="text/javascript"> 
	$(function() {
		
		$("#datepicker").datepicker({minDate: -0, maxDate: '+1M +10D'});
		$("#radio").buttonset();	
		
		var dates = $('#from, #to').datepicker({
			changeMonth: true,
			numberOfMonths: 2,
			onSelect: function(selectedDate) {
				var option = this.id == "from" ? "minDate" : "maxDate";
				var instance = $(this).data("datepicker");
				var date = $.datepicker.parseDate(instance.settings.dateFormat || $.datepicker._defaults.dateFormat, selectedDate, instance.settings);
				dates.not(this).datepicker("option", option, date);
			}
		}); 
	 
	});
</script>
<script language='javascript'>

function viewPattern(strP){
	if(strP=='Daily'){
		$('#divDaily').show();
		$('#divWeekly').hide();
		$('#divMonthly').hide(); 
		$('#spnTo').show(); 
	}else if(strP=='Weekly'){
		$('#divDaily').hide();
		$('#divWeekly').show()
		$('#divMonthly').hide();
		$('#spnTo').show();
	}else if(strP=='Monthly'){
		$('#divDaily').hide();
		$('#divWeekly').hide()
		$('#divMonthly').show();
		$('#spnTo').show();
	}else if(strP=='Once'){
		$('#divDaily').hide();
		$('#divWeekly').hide();
		$('#divMonthly').hide();
		$('#spnTo').hide();
	}
};
</script> 