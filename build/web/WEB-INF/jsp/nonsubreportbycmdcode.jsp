<%-- 
    Document   : nonsubreportbycmdcode
    Created on : Sep 6, 2014, 10:23:26 AM
    Author     : hungdt
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="include/prelude.jsp" %>
<html>
    <head>
        <%@include file="include/headinc.jsp" %>
        <script src="./js/highcharts.js"></script>
        <script src="./js/modules/exporting.js"></script>
        <script type="text/javascript">
            $(function() {
                $('#container1').highcharts({
                    chart: {
                        type: 'column'
                    },
                    title: {
                        text: 'Thống kê theo mã dịch vụ'
                    },
                    subtitle: {
                        text: 'Non Subscription'
                    },
                    xAxis: {
                        categories: ${categories}
                    },
                    yAxis: {
                        min: 0,
                        title: {
                            text: 'Số lượng'
                        }
                    },
                    tooltip: {
                        headerFormat: '<span style="font-size:10px">{point.key}</span><table>',
                        pointFormat: '<tr><td style="color:{series.color};padding:0">{series.name}: </td>' +
                                '<td style="padding:0"><b>{point.y:.1f}</b></td></tr>',
                        footerFormat: '</table>',
                        shared: true,
                        useHTML: true
                    },
                    plotOptions: {
                        column: {
                            pointPadding: 0.2,
                            borderWidth: 0
                        }
                    },
                    series: [{
                            name: 'MO',
                            data: ${mo}

                        }, {
                            name: 'MT',
                            data: ${mt}

                        }]
                });
            });
            /**
             * Sand-Signika theme for Highcharts JS
             * @author Torstein Honsi
             */

// Load the fonts
            Highcharts.createElement('link', {
                href: 'http://fonts.googleapis.com/css?family=Signika:400,700',
                rel: 'stylesheet',
                type: 'text/css'
            }, null, document.getElementsByTagName('head')[0]);

// Add the background image to the container
            Highcharts.wrap(Highcharts.Chart.prototype, 'getContainer', function(proceed) {
                proceed.call(this);
                this.container.style.background = 'url(http://www.highcharts.com/samples/graphics/sand.png)';
            });


            Highcharts.theme = {
                colors: ["#f45b5b", "#8085e9", "#8d4654", "#7798BF", "#aaeeee", "#ff0066", "#eeaaee",
                    "#55BF3B", "#DF5353", "#7798BF", "#aaeeee"],
                chart: {
                    backgroundColor: null,
                    style: {
                        fontFamily: "Signika, serif"
                    }
                },
                title: {
                    style: {
                        color: 'black',
                        fontSize: '16px',
                        fontWeight: 'bold'
                    }
                },
                subtitle: {
                    style: {
                        color: 'black'
                    }
                },
                tooltip: {
                    borderWidth: 0
                },
                legend: {
                    itemStyle: {
                        fontWeight: 'bold',
                        fontSize: '13px'
                    }
                },
                xAxis: {
                    labels: {
                        style: {
                            color: '#6e6e70'
                        }
                    }
                },
                yAxis: {
                    labels: {
                        style: {
                            color: '#6e6e70'
                        }
                    }
                },
                plotOptions: {
                    series: {
                        shadow: true
                    },
                    candlestick: {
                        lineColor: '#404048'
                    },
                    map: {
                        shadow: false
                    }
                },
                // Highstock specific
                navigator: {
                    xAxis: {
                        gridLineColor: '#D0D0D8'
                    }
                },
                rangeSelector: {
                    buttonTheme: {
                        fill: 'white',
                        stroke: '#C0C0C8',
                        'stroke-width': 1,
                        states: {
                            select: {
                                fill: '#D0D0D8'
                            }
                        }
                    }
                },
                scrollbar: {
                    trackBorderColor: '#C0C0C8'
                },
                // General
                background2: '#E0E0E8'

            };

// Apply the theme
            Highcharts.setOptions(Highcharts.theme);
        </script>
        <script>
            $(function() {
                $("#datepicker").datepicker("option", "dateFormat", "dd/mm/yyyy");
                $("#datepicker1").datepicker("option", "dateFormat", "dd/mm/yyyy");
            });
        </script>
    </head>
    <body class="skin-blue">
        <!-- header logo: style can be found in header.less -->
        <%@include file="include/header.jsp" %>
        <div class="wrapper row-offcanvas row-offcanvas-left">
            <!-- Left side column. contains the logo and sidebar -->
            <%@include file="include/leftmenu.jsp" %>
            <!-- Right side column. Contains the navbar and content of the page -->

            <aside class="right-side">
                <!-- Content Header (Page header) -->
                <section class="content-header">
                    <h1>
                        Báo cáo Non Subscription
                    </h1>
                    <ol class="breadcrumb">
                        <li><a href="#"><i class="fa fa-dashboard"></i> Home</a></li>
                        <li class="active">Nonsub Report</li>
                    </ol>
                </section>
                <!-- Main content -->
                <section class="content">
                    <!-- general form elements -->
                    <div class="box box-primary">
                        <!-- form start -->
                        <form>
                            <div class="box-body">
                                <table border = "0" cellpadding = "0" cellspacing = "0">
                                    <tr>
                                        <td>
                                            Đối tác:
                                        </td>
                                        <td style="padding-left: 10px;">
                                            <select  name="mId" class="form-control">
                                                <option value="0">Tất cả</option>
                                                <c:forEach items="${lstmerchant}" var="e" step="1" begin="0">

                                                    <c:if test="${merchantId == e.merchantId}">
                                                        <option value="${e.merchantId}" selected="selected">${e.alias}</option>
                                                    </c:if>
                                                    <c:if test="${merchantId != e.merchantId}">
                                                        <option value="${e.merchantId}">${e.alias}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td style="padding-left: 15px;">
                                            Đầu số:
                                        </td>
                                        <td style="padding-left: 10px;">
                                            <select  name="s" class="form-control">
                                                <c:forEach items="${sc}" var="e" step="1" begin="0">

                                                    <c:if test="${s == e}">
                                                        <option value="${e}" selected="selected">${e}</option>
                                                    </c:if>
                                                    <c:if test="${s != e}">
                                                        <option value="${e}">${e}</option>
                                                    </c:if>
                                                </c:forEach>
                                            </select>
                                        </td>
                                        <td style="padding-left: 15px;">
                                            Nhà mạng 
                                        </td>
                                        <td style="padding-left: 10px;">
                                            <select class="form-control" name="tId">

                                                <c:if test="${tId == 1}">
                                                    <option value="0" >Tất cả</option>
                                                    <option value="1" selected="selected">Mobifone</option>
                                                    <option value="2">Vinaphone</option>
                                                    <option value="3">Viettel</option>
                                                    <option value="4">Vietnamobile</option>
                                                </c:if>
                                                <c:if test="${tId ==2}">
                                                    <option value="0" >Tất cả</option>
                                                    <option value="1" >Mobifone</option>
                                                    <option value="2" selected="selected">Vinaphone</option>
                                                    <option value="3">Viettel</option>
                                                    <option value="4">Vietnamobile</option>
                                                </c:if>
                                                <c:if test="${tId ==3}">
                                                    <option value="0" >Tất cả</option>
                                                    <option value="1" >Mobifone</option>
                                                    <option value="2" >Vinaphone</option>
                                                    <option value="3" selected="selected">Viettel</option>
                                                    <option value="4">Vietnamobile</option>
                                                </c:if>
                                                <c:if test="${tId ==4}">
                                                    <option value="0" >Tất cả</option>
                                                    <option value="1" >Mobifone</option>
                                                    <option value="2" >Vinaphone</option>
                                                    <option value="3" >Viettel</option>
                                                    <option value="4" selected="selected">Vietnamobile</option>
                                                </c:if>
                                                <c:if test="${tId ==0}">
                                                    <option value="0" selected="selected" >Tất cả</option>
                                                    <option value="1" >Mobifone</option>
                                                    <option value="2" >Vinaphone</option>
                                                    <option value="3" >Viettel</option>
                                                    <option value="4">Vietnamobile</option>
                                                </c:if>
                                            </select>

                                        </td> 
                                    </tr>
                                    <tr>
                                        <td>Từ ngày</td>
                                        <td style="padding-left: 10px;"><input class="form-control date-picker" id="datepicker" type="text" name="f" value="${fromDate}"/></td>
                                        <td style="padding-left: 15px;">Đến ngày</td>
                                        <td style="padding-left: 10px;"><input class="form-control date-picker" id="datepicker1" type="text " name="t" value="${toDate}"/></td>
                                    </tr>
                                </table>
                            </div>
                            <div class="box-footer">
                                <button type="submit" class="btn btn-primary">Thống kê</button>
                            </div>
                        </form>
                    </div>
                    <div class="filter-container" style="margin-bottom: 10px;">
                        <div id="container1" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
                    </div>
                    <div class="box">
                        <div class="box-header">
                        </div><!-- /.box-header -->
                        <div class="box-body table-responsive">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th style="width: 15%">Mã dịch vụ</th>
                                        <th>MO</th>
                                        <th>MT</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${lst}" var="l">
                                        <tr>
                                            <td>${l.cmdCode}</td>

                                            <td>${l.mo}</td>
                                            <td>${l.mt}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </section>
            </aside>
        </div>
        <%@include file="include/footer.jsp" %>

    </body>
</html>
