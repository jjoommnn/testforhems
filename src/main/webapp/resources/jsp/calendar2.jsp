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
            'dayRender' : function( date, cell )
            {
            	var numDiv = $( ".fc-day-number", cell ).css( "float", "left" );
            	
            	var month = $('#calendar').fullCalendar( "getDate" ).format( "YYYY-MM" );
            	var dayMonth = date.format( "YYYY-MM" );
            	if( month != dayMonth )
            		return;
            	
            	if( !(dataCache[month]) )
            		return;
            	
            	var day = date.format( "YYYY-MM-DD" );
            	var data = dataCache[month][day];
            	if( !data )
            		return;
            	
            	$( cell.children( "div" )[0] ).append( '<div style="float:right;margin-top:15px">' + data.title + '</div>' );
            	
            	cell.tooltip({
                    items : "td",
                    content: function()
                    {
                        return "<div>" + day + "</div>" + 
                               "<div>누진" + data.level + "단계</div>" +
                               "<div>누적사용량:" + $parse( data.amount + "|number" )() + "kWh</div>" +
                               "<div>당일요금:" + $parse( data.fee + "|number" )() + "원</div>" +
                               "<div>누적요금:" + $parse( data.feeAcc + "|number" )() + "원</div>";
                    }
                });
            }
        });
    }
    
    function getAndAddData( $http, month )
    {
    	if( dataCache[month] )
    		return;
    	
    	$http.get('../../getCalendarData.do', { params : { month : month }, responseType : "json" }).
        success(function(data, status, headers, config)
        {
            onRecvData( month, data );
        }).
        error(function(data, status, headers, config)
        {
            alert( "Error" );
        });
    }
    
    function onRecvData( month, data )
    {
    	dataCache[month] = data;
    	$('#calendar').fullCalendar( 'render' );
    }
    </script>
</body>
</html>
