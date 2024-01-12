<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>

<%@page import="java.util.Calendar"%>

<%
request.setCharacterEncoding("utf-8");

Calendar cal = Calendar.getInstance();

// 시스템 오늘날짜
int ty = cal.get(Calendar.YEAR);
int tm = cal.get(Calendar.MONTH) + 1;
int td = cal.get(Calendar.DATE);

int year = cal.get(Calendar.YEAR);
int month = cal.get(Calendar.MONTH) + 1;

// 파라미터 받기
String sy = request.getParameter("year");
String sm = request.getParameter("month");

if (sy != null) { // 넘어온 파라미터가 있으면
	year = Integer.parseInt(sy);
}
if (sm != null) {
	month = Integer.parseInt(sm);
}

cal.set(year, month - 1, 1);
year = cal.get(Calendar.YEAR);
month = cal.get(Calendar.MONTH) + 1;

int week = cal.get(Calendar.DAY_OF_WEEK); // 1(일)~7(토)
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="icon" href="data:;base64,iVBORw0KGgo=">
<style type="text/css">
* {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

body {
	font-size: 14px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
}

a {
	color: #000;
	text-decoration: none;
	cursor: pointer;
}

a:active, a:hover {
	text-decoration: underline;
	color: #F28011;
}

.calendar {
	width: 280px;
	margin: 30px auto;
}

.calendar .title {
	height: 37px;
	line-height: 37px;
	text-align: center;
	font-weight: 600;
}

.calendar .selectField {
	border: 1px solid #999;
	padding: 2px 7px;
	border-radius: 3px;
	font-family: "맑은 고딕", 나눔고딕, 돋움, sans-serif;
	vertical-align: baseline;
}

.calendar table {
	width: 100%;
	border-collapse: collapse;
	border-spacing: 0;
}

.calendar table thead tr:first-child {
	background: #f6f6f6;
}

.calendar table td {
	padding: 10px;
	text-align: center;
	border: 1px solid #ccc;
}

.calendar table td:nth-child(7n+1) {
	color: red;
}

.calendar table td:nth-child(7n) {
	color: blue;
}

.calendar table td.gray {
	color: #ccc;
}

.calendar table td.today {
	font-weight: 700;
	background: #E6FFFF;
}

.calendar .footer {
	height: 25px;
	line-height: 25px;
	text-align: right;
	font-size: 12px;
}
</style>

<script type="text/javascript">
	function change() {
		var f = document.frm;
		f.action = "calendar2.jsp";
		f.submit();
	}
</script>

</head>
<body>

	<div ng-app="app" class="container">
  <div ng-controller="MainController as mc" ng-click="hideDatePopups()">

    <div class="dateTimePopup" ng-click="stopPropogate($event)">
      <div class="parentDiv">
        <div>
          <div class="input-group">
            <input value={{formatDate(popupDate)}} type="text" class="form-control" ng-click="showDatePickerPopup('0',$event)" readonly>
            <span class="input-group-addon" ng-click="showDatePickerPopup('0',$event)">
        <i class="glyphicon glyphicon-user"></i>
      </span>
          </div>
        </div>
        <div ng-show="showDatePickerPopupShown['0']" class="childDiv">
          <div class="row">
            <div class="col-md-8">
              <p>
                <div uib-datepicker="yyyy-MM-dd" ng-model="popupDate"></div>
              </p>
            </div>
            <div class="col-md-4">
              <p>

                <button class="pull-right btn btn-primary" ng-click="showDatePickerPopup('0',$event)">Close</button>
              </p>
              <p>
                <div uib-timepicker ng-model="popupDate" show-meridian="false">
                </div>
              </p>

            </div>

          </div>
        </div>
      </div>
    </div>

    <div class="dateTimePopup" ng-click="stopPropogate($event)">

      <div class="parentDiv">
        <div>
          <div class="input-group">
            <input value={{formatDate(popupDate2)}} type="text" class="form-control" ng-click="showDatePickerPopup('1',$event)" readonly>
            <span class="input-group-addon" ng-click="showDatePickerPopup('1',$event)">
        <i class="glyphicon glyphicon-user"></i>
      </span>
          </div>
        </div>
        <div ng-show="showDatePickerPopupShown['1']" class="childDiv">
          <div class="row">
            <div class="col-md-8">
              <p>
                <div uib-datepicker="yyyy-MM-dd" ng-model="popupDate2"></div>
              </p>
            </div>
            <div class="col-md-4">
              <p>

                <button class="pull-right btn btn-primary" ng-click="showDatePickerPopup('1',$event)">Close</button>
              </p>
              <p>

                <div uib-timepicker ng-model="popupDate2" show-meridian="false">
                </div>
              </p>

            </div>

          </div>
        </div>
      </div>
    </div>
   
   </div>
</div>

</body>
</html>