<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>LmsRight</title>
<!-- sweet alert import -->
<script src='${CTX_PATH}/js/sweetalert/sweetalert.min.js'></script>
<jsp:include page="/WEB-INF/view/common/common_include.jsp"></jsp:include>
<!-- sweet swal import -->
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>
<style>
.aChart {
	width: 1000px;
	height: 500px;
}

.slider {
	width: 100%;
	height: 33rem;
	position: relative;
	margin-top: 1.3%;
	overflow: hidden;
	z-index: 0;
}

.slider input[type="radio"] {
	display: none;
}

.slider .sliderwrap {
	margin: 0 auto;
	overflow: hidden;
	white-space: nowrap;
}

.slider .charts>li {
	display: inline-block;
	margin: 0 auto;
	vertical-align: middle;
	width: 100%;
	transition: all .5s;
}

.slider .charts>li>.aChart {
	display: block;
	position: relative;
}

.slider [id="slide1"]:checked ~ .sliderwrap .charts>li {
	transform: translateX(0%);
}

.slider [id="slide2"]:checked ~ .sliderwrap .charts>li {
	transform: translateX(-100%);
}

.slider [id="slide3"]:checked ~ .sliderwrap .charts>li {
	transform: translateX(-200%);
}

.slider [id="slide4"]:checked ~ .sliderwrap .charts>li {
	transform: translateX(-300%);
}

.slider [id="slide5"]:checked ~ .sliderwrap .charts>li {
	transform: translateX(-400%);
}

.bullets {
	position: absolute;
	left: 41%;
	bottom: 0%;
	z-index: 2;
}

.bullets label {
	display: inline-block;
	border-radius: 50%;
	background-color: lightgray;
	width: 12px;
	height: 12px;
	cursor: pointer;
	margin-left: 10px;
}

#chartHolder {
	height: fit-content;
	margin-bottom: 0;
}
</style>

<script type="text/javascript">
	google.charts.load('current', {
		'packages' : [ 'bar' ]
	});
	google.charts.setOnLoadCallback(drawChart);

	/** OnLoad event */
	$(function() {
		
		fn_surveyResult();
		
		drawChart();
		
	});
	
	
	  function fn_surveyResult(){
		var param = "";
		
		var resultCallBack = function(data){
			console.log(data.surveyResult);
			drawChart(data.surveyResult);
		}
		callAjax("/tut/surveyResult.do", "post", "json", "false", param, resultCallBack)
	} 
	
	
	function drawChart(data) {
		
		var list = ['만족도'];
		
		var i = 0;
		var item;
		var lname;
		var checkyn = true;
		
		/* for(key in data) {
			if(lname == data[key].name) {
				return false;
			}
			
			console.log(i + ' key:' + key + ' / ' + 'value:' + data[key]);
			
		    item = data[key];
				
			console.log("item.name : " + item.name);
			
			list.push(item.name);

			if(i == 0) {
				lname = data[key].name;
			}
		    i++
		    
		} */
		
		
		for(var i = 0; i < data.length; i++){
			list.push(data[i].name);
		}
		
		console.log(list);
		

		 /* var chartasd = google.visualization.arrayToDataTable([
				[ '만족도', '자바', '파이썬 초급', '파이썬 중급', '파이썬 고급' ], 
				[ '매우만족', 2, 5, 7, 2 ],
				[ '만족', 2, 5, 7, 2 ],
				[ '보통', 2, 5, 7, 2 ],
				[ '불만족', 2, 5, 7, 2 ],
				[ '매우불만족', 2, 5, 7, 2 ], 
				]);

		var options = {
			chart : {
				title : " [ " + "번 문항 ]",
				subtitle : "asd"
			}
		};

		var chart = new google.charts.Bar(document
				.getElementById('asd'));

		chart.draw(chartasd, google.charts.Bar.convertOptions(options));

		$("#bulletsDiv").show(); */
	}
</script>

</head>
<body>
	<form id="myForm" action="" method="">
		<input type="hidden" name="action" id="action" value="">

		<!-- 모달 배경 -->
		<div id="mask"></div>

		<div id="wrap_area">

			<h2 class="hidden">header 영역</h2>
			<jsp:include page="/WEB-INF/view/common/header.jsp"></jsp:include>

			<h2 class="hidden">컨텐츠 영역</h2>
			<div id="container">
				<ul>
					<li class="lnb">
						<!-- lnb 영역 --> <jsp:include
							page="/WEB-INF/view/common/lnbMenu.jsp"></jsp:include> <!--// lnb 영역 -->
					</li>
					<li class="contents">
						<!-- contents -->
						<h3 class="hidden">contents 영역</h3> <!-- content -->
						<div class="content">

							<p class="Location">
								<a href="../dashboard/dashboard.do" class="btn_set home">메인으로</a>
								<span class="btn_nav bold">커뮤니티</span> <span
									class="btn_nav bold">설문 조사 관리</span> <a href="../tut/survey.do"
									class="btn_set refresh">새로고침</a>
							</p>

							<p class="conTitle">
								<span>설문 조사 관리</span> 
							</p>

							<div class="slider" >
						<input type = "radio" name="slide" id="slide1" checked>
						<input type = "radio" name="slide" id="slide2">
						<input type = "radio" name="slide" id="slide3">
						<input type = "radio" name="slide" id="slide4">
						<input type = "radio" name="slide" id="slide5">
						<div class ="sliderwrap">
							<ul id = "chartHolder" class="charts">
								<li>
									<div id ="asd" class="aChart"></div>
								</li>
								<li>	
									<div id ="asd2" class="aChart"></div>
								</li>
								<li>
									<div id ="asd3" class="aChart"></div>
								</li>
								<li>
									<div id ="asd4" class="aChart"></div>
								</li>
								<li>
									<div id ="asd5" class="aChart"></div>
								</li>
							</ul>
							<div class="bullets" id = "bulletsDiv">
								<label for ="slide1">&nbsp;</label>
								<label for ="slide2">&nbsp;</label>
								<label for ="slide3">&nbsp;</label>
								<label for ="slide4">&nbsp;</label>
								<label for ="slide5">&nbsp;</label>
							</div>	
						</div>
					</div>

						</div> <!--// content -->

						<h3 class="hidden">풋터 영역</h3> <jsp:include
							page="/WEB-INF/view/common/footer.jsp"></jsp:include>
					</li>
				</ul>
			</div>
		</div>

		<!--// 모달팝업 -->
	</form>
</body>
</html>