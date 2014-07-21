<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
                    <div class="rep_info">
                        <strong>SEPTHMBER 2014</strong>
                        서울특별시 구로구 구로동 4352번지 <span class="cB">푸르지오 103동 1305호 님</span>
                    </div>
                    <p class="line"></p>
                    <div class="mt40 mb40"><img src="../images/hems_user/report/h1.jpg" alt="Monthly Energy Report 월간 에너지 리포트" /></div>

                    <div class="bx01">
                        <div class="tit">
                            <h2><img src="../images/hems_user/report/h2_01.gif" alt="이번 달 전기 사용량 & 요금" /></h2>
                            <span class="h2">검침기간 : 2014년 6월 01일 ~ 06월 30일</span>
                        </div>

                        <div class="clearfix">
                            <div class="conL">
                                <ul class="use clearfix mt35">
                                    <li>사용요금 : 00,000원(00.0%) <span class="icon01"></span></li>
                                    <li>사용량 : 00,000kWh(00.0%) <span class="icon02"></span></li>
                                    <!-- To.개발자 :
                                     class "icon01" - 동일
                                           "icon02" - 하락
                                           "icon03" - 상승
                                     -->
                                </ul>
                                <div id="chart" class="chart mt20" style="width:420px;height:300px;margin:0 auto">
                                </div>
                            </div>
                            <div class="conR money mt40">
                                <strong class="cB">\00,000,000 원</strong>
                                <p class="cB">(00,000,000 kWh)</p>
                                <ul class="mt35">
                                    <li>
                                        <span class="tit"><img src="../images/hems_user/report/txt_01.gif" alt="우리 사무실" /></span>
                                        <span class="k">(00,000,0000 kWh)</span><strong>00,0000,000원</strong>

                                    </li>
                                    <li>
                                        <span class="tit"><img src="../images/hems_user/report/txt_02.gif" alt="공용" /></span>
                                        <span class="k">(00,000,0000 kWh)</span><strong>00,0000,000원</strong>

                                    </li>
                                    <li>
                                        <span class="tit"><img src="../images/hems_user/report/txt_03.gif" alt="기본료" /></span>
                                        <strong>00,0000,000원</strong>
                                    </li>
                                </ul>
                                <div class="info">실제 계측된 사용량과 오차가 있을 수 있으며, 실제 부과되는 전기요금과는 다를 수 있습니다.</div>
                            </div>

                        </div>
                    </div>
                    <div class="bx02 mt50">
                        <h2><img src="../images/hems_user/report/h2_02.gif" alt="이웃세대간 비교" /></h2>
                        <ul class="clearfix">
                            <li>
                                <ul class="gap">
                                    <li>
                                        <div class="in">
                                        <strong>전체</strong>
                                        </div>
                                        <span>00,000,00</span>
                                    </li>
                                    <li class="type1">
                                        <div class="in" style="width:142px;"><!-- To.개발자 : width 값을 계산된 값을 넣어주세요. -->
                                            <strong>우리</strong>
                                        </div>
                                        <span>00,000,00</span>
                                    </li>
                                    <li class="type2">
                                        <div class="in" style="width:80px;"><!-- To.개발자 : width 값을 계산된 값을 넣어주세요. -->
                                        <strong>절약</strong>
                                        </div>
                                        <span>00,000,00</span>
                                    </li>
                                </ul>
                                <div class="info txt-c">
                                    <strong>이번 달 사용량</strong>
                                    <p>단위면적당 사용량 기준</p>
                                    <p>총 <span class="cB">00,000,00kWh</span> 사용하였습니다.</p>
                                </div>

                            </li>
                            <li>
                                <div class="level">
                                    <img src="../images/hems_user/report/level_04.jpg" alt="4단계" />
                                    <!-- To.개발자 :

                                    <img src="../images/hems_user/report/level_01.jpg" alt="1단계" />
                                    <img src="../images/hems_user/report/level_02.jpg" alt="2단계" />
                                    <img src="../images/hems_user/report/level_03.jpg" alt="3단계" />
                                    <img src="../images/hems_user/report/level_04.jpg" alt="4단계" />
                                    <img src="../images/hems_user/report/level_05.jpg" alt="5단계" />

                                     -->
                                </div>
                                <div class="info txt-c">
                                    <strong>이번 달 사용등급</strong>
                                    <p>이번 달 전기 <span class="cR">사용량이 너무 많습니다!</span></p>
                                    <p>절약 실천 노력이 필요합니다.</p>
                                </div>
                            </li>
                            <li>
                                <div class="rank">
                                    <strong class="t">총 500세대</strong>
                                    <img src="../images/hems_user/report/rank.jpg" alt="" />
                                    <div class="r"><strong>233</strong>위</div>
                                    <div>

                                        <strong class="n">105<span class="iconD"></span></strong>
                                        <!-- To.개발자 :
                                        class "iconD" - 순위 하락
                                              "iconS" - 순위 동일
                                              "iconU" - 순위 상승
                                        -->

                                    </div>

                                </div>
                                <div class="info txt-c">
                                    <strong>이번 달 사용순위</strong>
                                    <p>총 500세대 중 </span></p>
                                    <p><span class="cB">233위 상위 65%</span>입니다.</p>
                                </div>
                            </li>
                        </ul>
                    </div>
                    <div class="bx03 mt40">
                        <h4><span class="iconI"></span> 왜 절약세대보다 4,000원이 더 나왔을까?<span>(절약세대 : 이웃세대 중 전기사용량이 낮은 상위 30%세대)</span></h4>
                        <ul>
                            <li>- 우리 사무실은 이웃세대보다 화요일, 수요일에 전력을 더 많이 사용합니다.</li>
                            <li>- 우리 사무실은 이웃세대보다 0~7시, 9시, 17~19시에 전력을 더 많이 사용합니다.</li>
                            <li>- 우리 사무실은 이웃세대보다 0~7시, 9시, 17~19시에 전력을 더 많이 사용합니다.</li>
                        </ul>
                    </div>


                </div>
            </div>
        </div>

    </div>
    
    <script type="text/javascript">
    function Controller( $scope )
    {
    	
    }
    
    $(function()
    {
    	$('#chart').highcharts({
            title: {
                text: 'Combination chart'
            },
            xAxis: {
                categories: ['지난달', '이번달']
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                }
            },
            series: [{
                type: 'column',
                name: '지난달',
                data: [3, 0]
            }, {
                type: 'column',
                name: '이번달',
                data: [0, 2]
            }, {
                type: 'line',
                name: 'Average',
                data: [3, 2],
                marker: {
                    lineWidth: 2,
                    lineColor: Highcharts.getOptions().colors[3],
                    fillColor: 'white'
                }
            }]
        });
    });
    </script>
</body>
</html>
