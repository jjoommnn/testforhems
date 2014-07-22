<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en" class="snow" ng-app>
<head>
    <meta charset="utf-8">
    <title>olleh standard monitoring and control platform</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="../vendor/jquery-ui-1.10.3/themes/base/jquery-ui.css">
    <link rel='stylesheet' type="text/css" href="../vendor/fullcalendar-2.0.2/fullcalendar.css">
    <script type="text/javascript" src="../vendor/jquery-1.9.1/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../vendor/angular/angular.js"></script>
    <script type="text/javascript" src="../vendor/fullcalendar-2.0.2/lib/moment.min.js"></script>
    <script type="text/javascript" src="../vendor/fullcalendar-2.0.2/fullcalendar.min.js"></script>
</head>
<body>
    <h1>Calendar</h1>
    
    <input id="btn" type="button" value="Test" />
    
    <div id="calendar" style="width:500px;height:300px;"></div>
    
    <script type="text/javascript">
    $(function()
    {
    	$('#calendar').fullCalendar({
            'viewRender' : function( view, element )
            {
            	console.log( "viewRender" );
            }
        });
    	
    	$("#btn").click( function()
    	{
    		$('#calendar').fullCalendar( 'gotoDate', "2014-03-01" );
    	});
    });
    </script>
</body>
</html>
