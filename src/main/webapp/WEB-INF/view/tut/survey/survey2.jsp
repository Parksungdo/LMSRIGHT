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
<script src="https://www.gstatic.com/charts/loader.js"></script>
<link rel="stylesheet" type="text/css" href="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>

<style>
/* .slick-prev:before, .slick-next:before {
	color: #000 !important;
	width : 20%;
} */

/* .single-item {
	display : flex;
} */

.single-item p {
	font-size: 2rem;
	font-weight: bold;
	line-height: 100px;
	color: #666;
	margin: 10px;
	text-align: center;
	background-color: #e0e0e0;
	width : 100%;
}

.slick-list {
	width : 60%;
	
}
</style>

<script type="text/javascript">
	var list;
	$(function() {

		fn_surveyResult();

		$('.slick').slick( /* {
			  slide : 'li',
			  dots: true, //페이지 네비게이션
			  arrows:true, // next, prev 이동 버튼
			  autoplay:true, // 자동 넘김 여부
			  infinite: false, //반복설정
			  speed: 300, //슬라이드 속도
			  autoplaySpeed : 300,   // 자동 넘김시 슬라이드 시간
			  pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤
			  //vertical : false,  // 세로 방향 슬라이드 옵션
			  prevArrow : "<button type='button' class='slick-prev'>Previous</button>",        
			  nextArrow : "<button type='button' class='slick-next'>Next</button>", //화살표 커스텀
			  slidesToShow: 2, //보여질 슬라이드 수
			  slidesToScroll: 1, //넘겨질 슬라이드 수
			  responsive: [ // -> 반응형 옵션
			    {
			      breakpoint: 1024, // 반응형 ~ 1024
			      settings: {
			        slidesToShow: 3,
			        slidesToScroll: 3,
			        infinite: true,
			        dots: true
			      }
			    },
			    {
			      breakpoint: 600,// 반응형 ~ 600
			      settings: {
			        slidesToShow: 2,
			        slidesToScroll: 2
			      }
			    },
			    {
			      breakpoint: 480,// 반응형 ~ 480
			      settings: {
			        slidesToShow: 1,
			        slidesToScroll: 1
			      }
			    }
			  ]
			} */);

	});
	google.charts.load('current', {
		packages : [ 'bar' ],
	});
	google.charts.setOnLoadCallback(drawChart);

	function fn_surveyResult() {
		var param = "";

		var resultCallBack = function(data) {
			console.log(data.surveyResult);
			list = data.surveyResult;
			//drawChart(data.surveyResult);
		}
		callAjax("/tut/surveyResult.do", "post", "json", "false", param,
				resultCallBack)
	}

	function drawChart() {
		var data = list;
		console.log(data);

		var question = [ '설문조사항목' ];
		var name = [];
		var index = -1;
		var servey = [ [], [ '매우만족' ], [ '만족' ], [ '보통' ], [ '불만족' ],
				[ '매우불만족' ] ];

		// 이름 저장
		for (var i = 0; i < data.length; i++) {
			if (question.indexOf(data[i].serveyitem_question) == -1) {
				question.push(data[i].serveyitem_question);
			}
			if (name.indexOf(data[i].name) == -1) {
				name.push(data[i].name);
			}
		}

		console.log(name);
		console.log(question);
		servey[0] = question;

		for (var i = 0; i < servey[0].length; i++) {
			for (var ii = 0; ii < data.length; ii++) {
				for (var a = 1; a < 6; a++) {
					if (a === data[ii].serveyitem_queno) {
						if (question[i] === data[ii].serveyitem_question) {
							console.log('이름이랑 데이터랑 같아');

							servey[1].push(data[ii].answer1);
							servey[2].push(data[ii].answer2);
							servey[3].push(data[ii].answer3);
							servey[4].push(data[ii].answer4);
							servey[5].push(data[ii].answer5);
						}
					}
				}
				if (servey[1].length === 6) {
					console.log('--------------------------');
					console.log('전  :: ' + servey);

					// 차트그리기
					index++;
					console.log(index);
					console.log(name[index]);
					makeBarChart(servey, name[index], index);

					// 배열 비우기
					arraySplit(servey);
					console.log('==========================');
					console.log('전  :: ' + servey);
				}
			}
		}
		
		$('.single-item').slick({
			dots : false, // 도트 라디오 버튼
			arrows:false,
			infinite : true, // 무한반복
			autoplay : true, // 자동 넘김 여부
			autoplaySpeed : 3000, // 자동 넘김시 슬라이드 시간
			pauseOnHover : true,// 마우스 hover시 슬라이드 멈춤
			speed : 500, // 넘김 속도
			slidesToShow : 1, // 보이는 슬라이드
			slidesToScroll : 1, // 넘어가는 슬라이드
		});

	}

	// 차트 그리기
	function makeBarChart(servey, name, index) {
		console.log('makeBarChart :: ' + index);
		console.log(servey);

		var chartasd = google.visualization.arrayToDataTable(servey);

		var options = {
			chart : {
				title : ' [ ' + name + ' ] ',
				subtitle : name,
			},
		};

		var index = makeSlideButton(name, index);

		console.log('makeSlideButton index return:: ' + index);

		var chart = new google.charts.Bar(document
				.getElementById('asd' + index));

		chart.draw(chartasd, google.charts.Bar.convertOptions(options));
	}

	// 디브 및 라벨 및 라디오 버튼 만들기
	function makeSlideButton(name, index) {
		console.log('makeSlideButton :: ' + index);
		console.log(name);

		var hDiv = document.getElementById('chartHolder');
		var charLi = document.createElement('li');
		var charDiv = document.createElement('div');

		index += 1;

		if (!!document.getElementById(name) == false) {
			console.log('해당 디브 없어');
			charLi.setAttribute('id', 'asd' + index);
			hDiv.appendChild(charLi);
		}

		return index;
	}

	// 배열 비우기
	function arraySplit(servey) {
		console.log('arraySplit');

		for (var i = 1; i < servey.length; i++) {
			servey[i].length = 1;
		}

		return servey;
	}
</script>
</head>
<body>
	<form id="myForm" action="" method="">
		<div id="slider">
			<!-- <div id="radioDiv"></div> -->
			<div class="sliderwrap" id="sliderwrap">
				<div id="chartHolder" class="single-item"></div>
			</div>
		</div>
	</form>
<!-- <script type="text/javascript" src="slick/slick.min.js"></script> -->
<script type="text/javascript" src="//cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</body>
</html>
