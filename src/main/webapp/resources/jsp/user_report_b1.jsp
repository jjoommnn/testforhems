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
<body>
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
                        <span class="cB">푸르지오 단지</span>는 <span class="cB">누진제[주택용 저압]</span>를 적용 받고 있습니다.
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
                            <tr>
                                <td class="txt-c">6단계</td>
                                <td>0</td><!-- To.개발자 : 값이 0일때는 div.level 삭제 -->
                                <td class="txt-r">12,940원</td>
                                <td class="txt-r">709.5원</td>
                                <td class="txt-r">0</td>
                            </tr>
                            <tr>
                                <td class="txt-c">5단계</td>
                                <td>0</td>
                                <td class="txt-r">12,940원</td>
                                <td class="txt-r">709.5원</td>
                                <td class="txt-r">0</td>
                            </tr>
                            <tr class="on">
                                <td class="txt-c">4단계</td>
                                <td><div class="level" style="width:50px"></div>30</td><!-- To.개발자 : 값이 있을 div.level 추가 & width 값 넣어주세요 -->
                                <td class="txt-r">12,940원</td>
                                <td class="txt-r">709.5원</td>
                                <td class="txt-r">0</td>
                            </tr>
                            <tr>
                                <td class="txt-c">3단계</td>
                                <td><div class="level" style="width:220px"></div>100</td><!-- To.개발자 : 값이 최대 220을 넘지 않도록 해주세요!!!!!!!!!!! -->
                                <td class="txt-r">12,940원</td>
                                <td class="txt-r">709.5원</td>
                                <td class="txt-r">0</td>
                            </tr>
                            <tr>
                                <td class="txt-c">2단계</td>
                                <td><div class="level" style="width:220px"></div>100</td>
                                <td class="txt-r">12,940원</td>
                                <td class="txt-r">709.5원</td>
                                <td class="txt-r">0</td>
                            </tr>
                            <tr class="last">
                                <td class="txt-c">1단계</td>
                                <td><div class="level" style="width:220px"></div>100</td>
                                <td class="txt-r">12,940원</td>
                                <td class="txt-r">709.5원</td>
                                <td class="txt-r">0</td>
                            </tr>
                            </tbody>
                            <tfoot>
                            <tr>
                                <th colspan="4">총사용량요금 (기본요금 3,850원 포함)</th>
                                <td>65,510원</td>
                            </tr>
                            </tfoot>
                        </table>

                        <div class="info">
                            <span class="iconR"></span>우리 사무실의 이 달 <span class="cO">누진제 적용단계</span>는 <span class="cB">4단계</span> 입니다. 누진제 적용단계를 낮추면 전기 사용요금을 많이 절약할 수 있습니다.

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
    $(function()
    {
        $('#chart').highcharts({
            title: {
                text: 'Combination chart'
            },
            xAxis: {
                categories: ['1','2','3','4','5','6','7','8','9','10',
                             '11','12','13','14','15','16','17','18','19','20',
                             '21','22','23','24','25','26','27','28','29','30','31']
            },
            plotOptions: {
                column: {
                    stacking: 'normal',
                }
            },
            series: [{
                type: 'column',
                name: '누진1단계',
                data: [1,2,3,4,5,0,0,0,0,0,
                       0,0,0,0,0,0,0,0,0,0,
                       0,0,0,0,0,0,0,0,0,0,0]
            }, {
                type: 'column',
                name: '누진2단계',
                data: [0,0,0,0,0,6,7,8,9,4,
                       0,0,0,0,0,0,0,0,0,0,
                       0,0,0,0,0,0,0,0,0,0,0]
            }, {
                type: 'column',
                name: '누진3단계',
                data: [0,0,0,0,0,0,0,0,0,0,
                       10,11,12,13,12,0,0,0,0,0,
                       0,0,0,0,0,0,0,0,0,0,0]
            }, {
                type: 'column',
                name: '누진4단계',
                data: [0,0,0,0,0,0,0,0,0,0,
                       0,0,0,0,0,15,16,17,17,19,
                       0,0,0,0,0,0,0,0,0,0,0]
            }, {
                type: 'column',
                name: '누진5단계',
                data: [0,0,0,0,0,0,0,0,0,0,
                       0,0,0,0,0,0,0,0,0,0,
                       8,9,10,12,15,0,0,0,0,0,0]
            }, {
                type: 'column',
                name: '누진6단계',
                data: [0,0,0,0,0,0,0,0,0,0,
                       0,0,0,0,0,0,0,0,0,0,
                       0,0,0,0,0,3,4,3,5,6,2]
            }, {
                type: 'line',
                name: 'Average',
                data: [10,10,11,12,0,0,0,0,0,0,
                       15,17,19,13,0,0,0,0,0,0,
                       0,0,0,0,0,3,4,3,5,6,2],
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
