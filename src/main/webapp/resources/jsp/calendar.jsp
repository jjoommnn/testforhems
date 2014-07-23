<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="snow">
<head>
    <meta charset="utf-8">
    <title>olleh standard monitoring and control platform</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="../vendor/jquery-ui-1.10.3/themes/base/jquery-ui.css">
    <link rel='stylesheet' type="text/css" href="../vendor/fullcalendar-2.0.2/fullcalendar.css">
    <script type="text/javascript" src="../vendor/jquery-1.9.1/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../vendor/fullcalendar-2.0.2/lib/moment.min.js"></script>
    <script type="text/javascript" src="../vendor/fullcalendar-2.0.2/fullcalendar.min.js"></script>
</head>
<body>
    <h1>Calendar</h1>
    
    <div id="calendar" style="width:500px;height:300px;"></div>
    
    <script type="text/javascript">
    var dataCache = {};
    
    $(function initCalendar()
    {
        $('#calendar').fullCalendar({
            'viewRender' : function( view, element )
            {
                var month = $('#calendar').fullCalendar( "getDate" ).format( "YYYY-MM" );
                console.log( "viewRender : " + month );
                getAndAddData( month );
            }
        });
    });
    
    function getAndAddData( month )
    {
    	if( dataCache[month] )
    		return;
    	
    	//$.ajax( )
    	
    	var data = testData( month );
    	onRecvData( month , data );
    }
    
    function onRecvData( month, data )
    {
    	dataCache[month] = data;
    	$('#calendar').fullCalendar( "addEventSource", data );
    }
    
    function testData( month )
    {
    	var events = [
    	    { title : "1000KM", start : month + "-01" },
    	    { title : "1200KM", start : month + "-10" }
    	];
    	console.log( events );
    	return events;
    }
    </script>
</body>
</html>
