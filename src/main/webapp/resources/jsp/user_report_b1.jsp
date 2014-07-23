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
    item.put( "amount", new Float( amt ) ); //사용량
    item.put( "level", new Integer( i / 5 + 1 ) ); //누진 단계
    chartData.add( item );
}
//테스트를 위해 가짜 차트 데이터 생성

HashMap data = new HashMap();
data.put( "address", "푸르지오 단지" );
data.put( "type", "누진제[주택용 저압]" );
data.put( "chartData", chartData );

data.put( "level1Amount", new Float( 12345 ) );
data.put( "level1Percent", new Float( 100 ) );
data.put( "level1BasicFee", new Float( 12940 ) );
data.put( "level1UnitPrice", new Float( 709.5 ) );
data.put( "level1Fee", new Float( 23456 ) );

data.put( "level2Amount", new Float( 23456 ) );
data.put( "level2Percent", new Float( 100 ) );
data.put( "level2BasicFee", new Float( 12940 ) );
data.put( "level2UnitPrice", new Float( 709.5 ) );
data.put( "level2Fee", new Float( 34567 ) );

data.put( "level3Amount", new Float( 23456 ) );
data.put( "level3Percent", new Float( 30 ) );
data.put( "level3BasicFee", new Float( 12940 ) );
data.put( "level3UnitPrice", new Float( 709.5 ) );
data.put( "level3Fee", new Float( 34567 ) );

data.put( "level4Amount", new Float( 0 ) );
data.put( "level4Percent", new Float( 0 ) );
data.put( "level4BasicFee", new Float( 0 ) );
data.put( "level4UnitPrice", new Float( 0 ) );
data.put( "level4Fee", new Float( 0 ) );

data.put( "level5Amount", new Float( 0 ) );
data.put( "level5Percent", new Float( 0 ) );
data.put( "level5BasicFee", new Float( 0 ) );
data.put( "level5UnitPrice", new Float( 0 ) );
data.put( "level5Fee", new Float( 0 ) );

data.put( "level6Amount", new Float( 0 ) );
data.put( "level6Percent", new Float( 0 ) );
data.put( "level6BasicFee", new Float( 0 ) );
data.put( "level6UnitPrice", new Float( 0 ) );
data.put( "level6Fee", new Float( 0 ) );

data.put( "level", new Integer( 3 ) ); //누진단계

data.put( "totalAmount", new Float( 78901 ) );
data.put( "basicFee", new Float( 3456 ) );
data.put( "useFee", new Float( 56789 ) );

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
                        <span class="cB">{{data.address}}</span>는 <span class="cB">{{data.type}}</span>를 적용 받고 있습니다.
                    </div>
                    <p class="line"></p>
                    <div class="bx04 mt48">
                        <div class="tit">
                            <h2><img src="../images/hems_user/report/h2_03.gif" alt="월간 시간대별 사용량 추이" /></h2>
                        </div>
                        <div id="chart" class="chart mt20" style="width:1048px;height:270px; margin:0 auto">
                        </div>
                    </div>
                    <div class="bx05 mt40">
                        <h2 class="mt40"><img src="../images/hems_user/report/h2_06.gif" alt="월간 누진단계별 요금 비율" /></h2>
                        <table class="mt40">
                            <colgroup>
                                <col style="width:126px" />
                                <col />
                                <col style="width:205px" />
                                <col style="width:205px" />
                                <col style="width:205px" />
                            </colgroup>
                            <thead>
                            <tr>
                                <th>단계</th>
                                <th>사용량 (kWh)</th>
                                <th>기본요금</th>
                                <th>전력 단가</th>
                                <th>사용량 요금</th>
                            </tr>
                            </thead>
                            <tbody>
                            <tr ng-class="{on:data.level==6}">
                                <td class="txt-c">6단계</td>
                                <td>
	                                <div class="level" ng-if="data.level6Percent > 0" style="width:{{200*data.level6Percent/100}}px"></div>
	                                {{data.level6Amount|number}}
                                </td>
                                <td class="txt-r">{{data.level6BasicFee|number}} 원</td>
                                <td class="txt-r">{{data.level6UnitPrice|number}} 원</td>
                                <td class="txt-r">{{data.level6Fee|number}} 원</td>
                            </tr>
                            <tr ng-class="{on:data.level==5}">
                                <td class="txt-c">5단계</td>
                                <td>
                                    <div class="level" ng-if="data.level5Percent > 0" style="width:{{200*data.level5Percent/100}}px"></div>
                                    {{data.level5Amount|number}}
                                </td>
                                <td class="txt-r">{{data.level5BasicFee|number}} 원</td>
                                <td class="txt-r">{{data.level5UnitPrice|number}} 원</td>
                                <td class="txt-r">{{data.level5Fee|number}} 원</td>
                            </tr>
                            <tr ng-class="{on:data.level==4}">
                                <td class="txt-c">4단계</td>
                                <td>
                                    <div class="level" ng-if="data.level4Percent > 0" style="width:{{200*data.level4Percent/100}}px"></div>
                                    {{data.level4Amount|number}}
                                </td>
                                <td class="txt-r">{{data.level4BasicFee|number}} 원</td>
                                <td class="txt-r">{{data.level4UnitPrice|number}} 원</td>
                                <td class="txt-r">{{data.level4Fee|number}} 원</td>
                            </tr>
                            <tr ng-class="{on:data.level==3}">
                                <td class="txt-c">3단계</td>
                                <td>
                                    <div class="level" ng-if="data.level3Percent > 0" style="width:{{200*data.level3Percent/100}}px"></div>
                                    {{data.level3Amount|number}}
                                </td>
                                <td class="txt-r">{{data.level3BasicFee|number}} 원</td>
                                <td class="txt-r">{{data.level3UnitPrice|number}} 원</td>
                                <td class="txt-r">{{data.level3Fee|number}} 원</td>
                            </tr>
                            <tr ng-class="{on:data.level==2}">
                                <td class="txt-c">2단계</td>
                                <td>
                                    <div class="level" ng-if="data.level2Percent > 0" style="width:{{200*data.level2Percent/100}}px"></div>
                                    {{data.level2Amount|number}}
                                </td>
                                <td class="txt-r">{{data.level2BasicFee|number}} 원</td>
                                <td class="txt-r">{{data.level2UnitPrice|number}} 원</td>
                                <td class="txt-r">{{data.level2Fee|number}} 원</td>
                            </tr>
                            <tr class="last" ng-class="{on:data.level==1}">
                                <td class="txt-c">1단계</td>
                                <td>
                                    <div class="level" ng-if="data.level1Amount > 0" style="width:{{200*data.level1Percent/100}}px"></div>
                                    {{data.level1Amount|number}}
                                </td>
                                <td class="txt-r">{{data.level1BasicFee|number}} 원</td>
                                <td class="txt-r">{{data.level1UnitPrice|number}} 원</td>
                                <td class="txt-r">{{data.level1Fee|number}} 원</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="4">총사용량요금 (기본요금 {{data.basicFee|number}} 원 포함)</th>
                                <td>{{data.useFee|number}}원</td>
                            </tr>
                            </tfoot>
                        </table>
                        <div class="info">
                            <span class="iconR"></span>우리 사무실의 이 달 <span class="cO">누진제 적용단계</span>는 <span class="cB">{{data.level}} 단계</span> 입니다. 누진제 적용단계를 낮추면 전기 사용요금을 많이 절약할 수 있습니다.
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
    
    <div style="text-align:center"><a href="../../pdfdownload.do?page=user_report_b1.jsp">PDF Download</a></div>
    
    <script type="text/javascript">
    var data = <%=dataStr%>;
    
    function Controller( $scope )
    {
    	$scope.data = data;
    	drawChart( data.chartData );
    }
    
    function drawChart( data )
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
    	    
    		if( value.level <= 1 )
    			level1[index] = value.amount;
    		else if( value.level <= 2 )
    			level2[index] = value.amount;
    		else if( value.level <= 3 )
                level3[index] = value.amount;
    		else if( value.level <= 4 )
                level4[index] = value.amount;
    		else if( value.level <= 5 )
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
                }, series: {
                    animation: false
                }
            }, series: [
                {
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
	            }
            ]
        });
    }
    </script>
</body>
</html>
