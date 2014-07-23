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
    <script type="text/javascript" src="../vendor/jquery-ui-1.10.3/ui/jquery-ui.js"></script>
    <script type="text/javascript" src="../vendor/angular/angular.js"></script>
    <script type="text/javascript" src="../vendor/fullcalendar-2.0.2/lib/moment.min.js"></script>
    <script type="text/javascript" src="../vendor/fullcalendar-2.0.2/fullcalendar.min.js"></script>
</head>
<body ng-controller="Controller">
    <h1>Calendar</h1>
    
    <div id="calendar" style="width:500px;height:300px;"></div>
    
    <script type="text/javascript">
    var dataCache = {};
    
    function Controller( $parse, $http )
    {
    	initCalendar( $parse, $http );
    }
    
    function initCalendar( $parse, $http )
    {
        $('#calendar').fullCalendar({
            'viewRender' : function( view, element )
            {
                var month = $('#calendar').fullCalendar( "getDate" ).format( "YYYY-MM" );
                getAndAddData( $http, month );
            },
            eventRender: function( event, element )
            {
            	if( event.level <= 1 )
            	    element.css( "background-color", "#0CA1D9" );
            	else if( event.level <= 2 )
            		element.css( "background-color", "#17C5B9" );
            	else if( event.level <= 3 )
                    element.css( "background-color", "#94C85A" );
            	else if( event.level <= 4 )
                    element.css( "background-color", "#D8BD56" );
            	else if( event.level <= 5 )
                    element.css( "background-color", "#EC9641" );
            	else
                    element.css( "background-color", "#C43233" );
            	
            	element.tooltip({
                	items : "div",
                    content: function()
                    {
                    	return "<div>" + event.start.format( "YYYY-MM-DD" ) + "</div>" + 
                    	       "<div>누진" + event.level + "단계</div>" +
                    	       "<div>누적사용량:" + $parse( event.amount + "|number" )() + "kWh</div>" +
                    	       "<div>당일요금:" + $parse( event.fee + "|number" )() + "원</div>" +
                    	       "<div>누적요금:" + $parse( event.feeAcc + "|number" )() + "원</div>";
                    }
                });
            }
        });
    }
    
    function getAndAddData( $http, month )
    {
    	if( dataCache[month] )
    		return;
    	
    	//ajax로 해당 월의 데이터를 받아온다.
    	//$http.get('/someUrl', { responseType : "json" }).
        //success(function(data, status, headers, config) {
        //    onRecvData( month, data );
        //}).
        //error(function(data, status, headers, config) {
        //    alert( "Error" );
        //});
    	
    	//테스트를 위해 가짜 데이터 생성
    	var data = testData( month );
    	onRecvData( month , data );
    }
     
    //ajax로 데이터가 도착하면 여기서 처리함
    function onRecvData( month, data )
    {
    	dataCache[month] = data;
    	$('#calendar').fullCalendar( "addEventSource", data );
    }
    
    function testData( month )
    {
    	var events = [
    	    { start : month + "-01", title : "10,000원", fee : 10000, feeAcc : 23456, amount : 23456, level : 1 },
    	    { start : month + "-03", title : "20,000원", fee : 20000, feeAcc : 67893, amount : 45678, level : 2 },
    	    { start : month + "-10", title : "30,000원", fee : 30000, feeAcc : 67893, amount : 45678, level : 3 },
    	    { start : month + "-17", title : "40,000원", fee : 40000, feeAcc : 67893, amount : 45678, level : 4 },
    	    { start : month + "-23", title : "50,000원", fee : 50000, feeAcc : 67893, amount : 45678, level : 5 },
    	    { start : month + "-28", title : "50,000원", fee : 60000, feeAcc : 67893, amount : 45678, level : 6 },
    	];
    	return events;
    }
    </script>
</body>
</html>
