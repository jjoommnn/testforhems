<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="org.codehaus.jackson.map.ObjectMapper"%>
<%
//
//DB에서 data 쿼리 필요
//

//테스트를 위해 가짜 차트 데이터 생성
ArrayList chartData = new ArrayList();
Random rnd = new Random();
for( int i = 0; i <= 30; i++ ) //해당 월의 날짜만큼
{
    int amt = rnd.nextInt( 500 );
    HashMap item = new HashMap();
    item.put( "amount", new Integer( amt ) ); //사용량
    item.put( "level", new Integer( i / 5 ) ); //누진 단계, 0이면 1단계
    chartData.add( item );
}
//테스트를 위해 가짜 차트 데이터 생성

HashMap data = new HashMap();
data.put( "chartData", chartData );

ObjectMapper mapper = new ObjectMapper();
String dataStr = mapper.writeValueAsString( data );
%>
<!DOCTYPE html>
<html lang="en" class="snow" ng-app>
<!--
To.개발자 : html 추가 class 명입니다.
    sunny
    cloudy
    fog
    snow
    rain
 -->
<head>
    <meta charset="utf-8">
    <title>olleh standard monitoring and control platform</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">

    <link rel="stylesheet" type="text/css" href="../vendor/bootstrap-2.3.2/css/bootstrap.min.css">
    <link rel="stylesheet" type="text/css" href="../vendor/jquery-ui-1.10.3/themes/base/jquery-ui.css">
    <link rel="stylesheet" type="text/css" href="../css/base.css">
    <link rel="stylesheet" type="text/css" href="../css/user.css">
    <script type="text/javascript" src="../vendor/jquery-1.9.1/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="../vendor/angular/angular.js"></script>
    <script type="text/javascript" src="../vendor/highcharts/highcharts.js"></script>
    <script type="text/javascript" src="../vendor/hems_ui.js"></script>
</head>
<body ng-controller="Controller">
    <div class="wrap rep">
        <div class="header">
            <h1><a href="#none">ZERO Zone Energy Real-time Optimizer</a></h1>
            <div class="gnb">
                <ul>
                    <li class="m1"><a href="#none">HOME</a></li>
                    <li class="m2"><a href="#none">통계</a></li>
                </ul>
            </div>
            <div class="user_info type2">
                본 리포트는 K-MEG 시범사업으로 제공되는 리포트입니다.<br/>
                http://www.domain.co.kr
            </div>
        </div>
        <div class="container">
            <div class="content">
                <div class="reportBx mt20">
                    <div class="rep_info type2">
                        <span class="cB">푸르지오 단지</span>는 <span class="cB">계절시간별요금제(가을철 9~10월 기준)</span>를 적용 받고 있습니다.
                    </div>
                    <p class="line"></p>

                    <div class="bx04 mt48">
                        <div class="tit">
                            <h2><img src="../images/hems_user/report/h2_05.gif" alt="월간 시간대별 사용량 추이" /></h2>
                        </div>

                        <div id="chart" class="chart mt20" style="width:1048px;height:270px; margin:0 auto">
                        </div>
                    </div>
                    <div class="bx07 mt40">
                        <h2 class="mt40"><img src="../images/hems_user/report/h2_04.gif" alt="월간 시간대별 요금 비율" /></h2>
                        <div class="clearfix mt30">
                            <div class="conL">
                                <div id="chart2" class="chart" style="width:350px;height:270px; margin:0 auto">
                                </div>
                            </div>
                            <div class="conR">
                                <h4>구간 별 사용 요금</h4>
                                <table>
                                    <colgrounp>
                                        <col style="width:260px;" />
                                        <col style="width:70px;" />
                                        <col style="width:256px;" />
                                    </colgrounp>
                                    <tbody>
                                    <tr>
                                        <th><span class="round01"></span>경부하 <span>(56.1 원/kWh)</span></th>
                                        <th>40.3%</th>
                                        <th class="txt-r">00,000,000 원(00,000,000 kWh)</th>
                                    </tr>
                                    <tr>
                                        <th><span class="round02"></span>경부하 <span>(56.1 원/kWh)</span></th>
                                        <th>40.3%</th>
                                        <th class="txt-r">00,000,000 원(00,000,000 kWh)</th>
                                    </tr>
                                    <tr>
                                        <th><span class="round03"></span>경부하 <span>(56.1 원/kWh)</span></th>
                                        <th>40.3%</th>
                                        <th class="txt-r">00,000,000 원(00,000,000 kWh)</th>
                                    </tr>
                                    </tbody>
                                </table>

                                <div class="info">
                                    <span class="iconR"></span>우리 사무실의 이 달 <span class="cO">최대부하구간</span>사용요금이 <span class="cB">29.0%</span>의 비중을 차지합니다. 최대부하구간 사용량을
                                    줄이면 전기 사용요금을 많이 절약할 수 있습니다.
                                </div>
                            </div>

                        </div>


                    </div>
                    <div class="bx06 mt40">
                        <h2 class="mt40"><img src="../images/hems_user/report/h2_tip.gif" alt="전기절약 TIP" /></h2>
                        <ul class="clearfix">
                            <li>
                                <span class="iconTip01"></span>
                                전기 콘센트를 ON/OFF 기능이 있는 것으로<br/>
                                교체해 보세요. 약 <span class="cG">3%의 절약</span>이 가능해요~

                            </li>
                            <li>
                                <span class="iconTip02"></span>
                                전기밥솥보다 <span class="cG">압력밥솥</span>을 이용해보세요.<br/>
                                전기밥솥은 전기 먹는 하마예요~

                            </li>
                        </ul>
                    </div>


                </div>
            </div>
        </div>

    </div>
    
    <script type="text/javascript">
    var data = <%=dataStr%>;
    
    function Controller( $scope )
    {
    	$scope.data = data;
        drawChart1( data.chartData );
    	drawChart2();
    }
    
    function drawChart1( data )
    {
    	var categories = [];
        var level1 = [];
        var level2 = [];
        var level3 = [];
        var level4 = [];
        var level5 = [];
        var level6 = [];
        var line = [];
        
        $.each( data, function( index, value )
        {
            categories[index] = "" + ( index + 1 );
            level1[index] = 0;
            level2[index] = 0;
            level3[index] = 0;
            level4[index] = 0;
            level5[index] = 0;
            level6[index] = 0;
            line[index] = value.amount;
            
            if( value.level < 1 )
                level1[index] = value.amount;
            else if( value.level < 2 )
                level2[index] = value.amount;
            else if( value.level < 3 )
                level3[index] = value.amount;
            else if( value.level < 4 )
                level4[index] = value.amount;
            else if( value.level < 5 )
                level5[index] = value.amount;
            else
                level6[index] = value.amount;
        });
        
        $('#chart').highcharts({
            title: {
                text: ''
            },
            xAxis: {
                categories: categories
            },
            yAxis : {
                title : {
                    text : "사용량"
                }
            }, plotOptions: {
                column: {
                    stacking: 'normal',
                }
            },
            series: [{
                type: 'column',
                name: '누진1단계',
                color : "#0CA1D9",
                data: level1
            }, {
                type: 'column',
                name: '누진2단계',
                color : "#17C5B9",
                data: level2
            }, {
                type: 'column',
                name: '누진3단계',
                color : "#94C85A",
                data: level3
            }, {
                type: 'column',
                name: '누진4단계',
                color : "#D8BD56",
                data: level4
            }, {
                type: 'column',
                name: '누진5단계',
                color : "#EC9641",
                data: level5
            }, {
                type: 'column',
                name: '누진6단계',
                color : "#C43233",
                data: level6
            }, {
                type: 'line',
                name: '사용량',
                color : "#C2C2C0",
                data: line,
                marker: {
                    lineWidth: 2,
                    lineColor: "#777777",
                    fillColor: 'white'
                }
            }]
        });
    }
    
    function drawChart2()
    {
        $("#chart2").highcharts({
            title: {
                text: ''
            }, plotOptions: {
                pie: {
                	slicedOffset : 5,
                	dataLabels : {
                		distance: -50,
                		color : "#222222"
                	}
                }
            },
            series: [{
                type: 'pie',
                name: '비율',
                data: [
                    {
                    	name:"경부하",
                    	y:30,
                    	color : "#94C85A",
                    	sliced: true
                    },
                    {
                    	name:"중부하",
                    	y:30,
                    	color : "#D8BD56",
                    	sliced:true
                    },
                    {
                    	name:"고부하",
                    	y:40,
                    	color : "#C43233",
                    	sliced:true
                    }
                ]
            }]
        });
    }
    </script>
</body>
</html>
