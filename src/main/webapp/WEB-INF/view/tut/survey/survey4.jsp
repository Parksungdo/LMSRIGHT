<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<title>LmsRight</title>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

<link rel="stylesheet" type="text/css"
	href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>

<style>
/* .aChart {
                width: 1000px;
                height: 500px;
            }

            #slider {
                width: 100%;
                height: 33rem;
                position: relative;
                margin-top: 1.3%;
                overflow: hidden;
                z-index: 0;
            }

            #slider input[type='radio'] {
                display: none;
            }

            #slider .sliderwrap {
                margin: 0 auto;
                overflow: hidden;
                white-space: nowrap;
            }

            #slider .charts > li {
                display: inline-block;
                margin: 0 auto;
                vertical-align: middle;
                width: 100%;
                transition: all 0.5s;
            }

            #slider .charts > li > .aChart {
                display: block;
                position: relative;
            }

            #slider.radioDiv[id='slide1']:checked ~ .sliderwrap .charts > li {
                transform: translateX(0%);
            }

            #slider .radioDiv [id='slide2']:checked ~ .sliderwrap .charts > li {
                transform: translateX(-100%);
            }

            #slider .radioDiv [id='slide3']:checked ~ .sliderwrap .charts > li {
                transform: translateX(-200%);
            }

            #slider .radioDiv [id='slide4']:checked ~ .sliderwrap .charts > li {
                transform: translateX(-300%);
            }

            #slider .radioDiv [id='slide5']:checked ~ .sliderwrap .charts > li {
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
            } */
.slick-prev:before, .slick-next:before {
	color: #000 !important;
}

.single-item p {
	font-size: 2rem;
	font-weight: bold;
	line-height: 100px;
	color: #666;
	margin: 10px;
	text-align: center;
	background-color: #e0e0e0;
}
</style>

<script type="text/javascript">
	google.charts.load('current', {
		packages : [ 'bar' ],
	});
	google.charts.setOnLoadCallback(drawChart);

	function drawChart() {
		var data = [
				{
					lecture_seq : 1,
					detail_name : '자바',
					servey_no : 1,
					serveyitem_queno : 1,
					serveyitem_question : '기업연수 환경 중 연수원 시설 (강의실 시설, 컴퓨터 장비 등)은 만족 하십니까?',
					answer1 : 0,
					answer2 : 0,
					answer3 : 0,
					answer4 : 1,
					answer5 : 0,
				},

				{
					lecture_seq : 1,
					detail_name : '파이썬',
					servey_no : 1,
					serveyitem_queno : 1,
					serveyitem_question : '식사는 어떠하십니까? (식단, 식사 질등)',
					answer1 : 0,
					answer2 : 0,
					answer3 : 1,
					answer4 : 0,
					answer5 : 0,
				},
				{
					lecture_seq : 1,
					detail_name : '자바',
					servey_no : 1,
					serveyitem_queno : 2,
					serveyitem_question : '연수원 시설 외 나머지 기업 연수원 환경(분위기, 하루 일정 등 기타 환경은 어떻게 생각하십니까? (전체적인 답변)',
					answer1 : 1,
					answer2 : 0,
					answer3 : 0,
					answer4 : 0,
					answer5 : 0,
				},
				{
					lecture_seq : 1,
					detail_name : '파이썬',
					servey_no : 1,
					serveyitem_queno : 2,
					serveyitem_question : '교재나 커리 큘럼은 실무교육을 받는데 적절 하다고 생각하십니까?',
					answer1 : 0,
					answer2 : 1,
					answer3 : 0,
					answer4 : 0,
					answer5 : 0,
				},
				{
					lecture_seq : 1,
					detail_name : '자바',
					servey_no : 1,
					serveyitem_queno : 3,
					serveyitem_question : '강사와 강의 내용에 대해선 만족하십니까?',
					answer1 : 0,
					answer2 : 0,
					answer3 : 0,
					answer4 : 1,
					answer5 : 0,
				},
				{
					lecture_seq : 2,
					detail_name : '파이썬',
					servey_no : 1,
					serveyitem_queno : 3,
					serveyitem_question : '기업연수 환경 중 연수원 시설 (강의실 시설, 컴퓨터 장비 등)은 만족 하십니까?',
					answer1 : 0,
					answer2 : 1,
					answer3 : 0,
					answer4 : 0,
					answer5 : 1,
				},
				{
					lecture_seq : 2,
					detail_name : '자바',
					servey_no : 1,
					serveyitem_queno : 4,
					serveyitem_question : '식사는 어떠하십니까? (식단, 식사 질등)',
					answer1 : 0,
					answer2 : 1,
					answer3 : 0,
					answer4 : 1,
					answer5 : 0,
				},
				{
					lecture_seq : 2,
					detail_name : '파이썬',
					servey_no : 1,
					serveyitem_queno : 4,
					serveyitem_question : '연수원 시설 외 나머지 기업 연수원 환경(분위기, 하루 일정 등 기타 환경은 어떻게 생각하십니까? (전체적인 답변)',
					answer1 : 1,
					answer2 : 0,
					answer3 : 0,
					answer4 : 1,
					answer5 : 0,
				},
				{
					lecture_seq : 2,
					detail_name : '자바',
					servey_no : 1,
					serveyitem_queno : 5,
					serveyitem_question : '교재나 커리 큘럼은 실무교육을 받는데 적절 하다고 생각하십니까?',
					answer1 : 1,
					answer2 : 0,
					answer3 : 1,
					answer4 : 0,
					answer5 : 0,
				},

				{
					lecture_seq : 2,
					detail_name : '파이썬',
					servey_no : 1,
					serveyitem_queno : 5,
					serveyitem_question : '강사와 강의 내용에 대해선 만족하십니까?',
					answer1 : 0,
					answer2 : 0,
					answer3 : 2,
					answer4 : 1,
					answer5 : 0,
				}, ];

		console.log(data);

		var question = [];
		var name = [ '과목명' ];
		var index = -1;
		var servey = [ [], [ '매우만족' ], [ '만족' ], [ '보통' ], [ '불만족' ],
				[ '매우불만족' ] ];

		// 이름 저장
		for (var i = 0; i < data.length; i++) {
			if (question.indexOf(data[i].serveyitem_question) == -1) {
				question.push(data[i].serveyitem_question);
			}
			if (name.indexOf(data[i].detail_name) == -1) {
				name.push(data[i].detail_name);
			}
		}

		console.log(name);
		console.log(question);

		servey[0] = name;

		var length = question.length;

		// 설문과목별
		for (var ii = 0; ii < data.length; ii++) {
			for (var a = 0; a < question.length; a++) {
				if (question[a] === data[ii].serveyitem_question) {
					console.log('----------문항이 같아요-----------');

					servey[1].push(data[ii].answer1);
					servey[2].push(data[ii].answer2);
					servey[3].push(data[ii].answer3);
					servey[4].push(data[ii].answer4);
					servey[5].push(data[ii].answer5);
				}
			}
			if (servey[1].length === name.length) {
				// 차트 그리기
				index++;
				console.log(index);
				console.log(question[index]);
				makeBarChart(servey, question[index], index);

				// 배열 비우기
				console.log('   전    ::   ' + servey);
				arraySplit(servey);
				console.log('   후    ::   ' + servey);
			}
		}

		// 과목별
		//     for (var i = 0; i < servey[0].length; i++) { // 문항
		//         for (var ii = 0; ii < data.length; ii++) { // 전체 데이터
		//             for (var a = 1; a < 6; a++) { // 문항수
		//                 if (a === data[ii].serveyitem_queno) {
		//                     if (question[i] === data[ii].serveyitem_question) {
		//                         console.log('이름이랑 데이터랑 같아');

		//                         servey[1].push(data[ii].answer1);
		//                         servey[2].push(data[ii].answer2);
		//                         servey[3].push(data[ii].answer3);
		//                         servey[4].push(data[ii].answer4);
		//                         servey[5].push(data[ii].answer5);
		//                     }
		//                 }
		//             }
		//             if (servey[1].length === 6) {
		//                 console.log('--------------------------');
		//                 console.log('전  :: ' + servey);

		//                 // 차트그리기
		//                 index++;
		//                 console.log(index);
		//                 console.log(name[index]);
		//                 makeBarChart(servey, name[index], index);

		//                 // 배열 비우기
		//                 arraySplit(servey);
		//                 console.log('==========================');
		//                 console.log('전  :: ' + servey);
		//             }
		//         }
		//     }

		//     document.getElementById('slide1').checked;

		$('.single-item').slick({
			dots : true,
			infinite : true,
			speed : 500,
			slidesToShow : 1,
			slidesToScroll : 1,
		});
	}

	// 차트 그리기
	function makeBarChart(servey, name, index) {
		console.log('makeBarChart :: ' + index);

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

		// var rDiv = document.getElementById('radioDiv');
		// var charInput = document.createElement('input');

		// var bDiv = document.getElementById('bulletsDiv');
		// var charLabel = document.createElement('label');

		var hDiv = document.getElementById('chartHolder');
		var charLi = document.createElement('div');
		var charDiv = document.createElement('div');

		// if (document.getElementById('radioDiv').childNodes.length == 0) {
		//     console.log('radioDiv 없어 :: ' + index);
		// }

		index += 1;

		// if (!!document.getElementById('slide' + index) == false) {
		//     charInput.setAttribute('type', 'radio');
		//     charInput.setAttribute('id', 'slide' + index);
		//     rDiv.appendChild(charInput);
		// }

		// charLabel.setAttribute('for', 'slide' + index);
		// bDiv.appendChild(charLabel);
		// document.getElementById('slide' + index).innerText('&nbsp;');

		if (!!document.getElementById(name) == false) {
			console.log('해당 디브 없어');
			// charDiv.setAttribute('id', 'asd' + index);
			// charDiv.setAttribute('class', 'aChart');
			// charLi.appendChild(charDiv);

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
			<div class="sliderwrap">
				<div id="chartHolder" class="charts single-item"></div>
			</div>
		</div>
	</form>
	<script type="text/javascript"
		src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
</body>
</html>
