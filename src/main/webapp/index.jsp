<%@ page import="com.tictactoe.Sign" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
	<script src="<c:url value="/static/jquery-3.6.0.min.js"/>"></script>

	<title>Tic-Tac-Toe</title>
	<style>
		body {
			background: #0f0f0f; /* Глубокий черный фон */
			font-family: 'Roboto', sans-serif; /* Современный шрифт */
			color: #0ff; /* Неоновый текст для заголовка */
			text-align: center;
			margin: 0;
			padding: 0;
		}

		h1 {
			margin: 20px 0;
			font-size: 36px;
			text-shadow: 0 0 10px #0ff, 0 0 20px rgba(0, 255, 255, 0.8);
		}

		table {
			margin: 50px auto;
			border-spacing: 10px; /* Расстояние между ячейками */
			perspective: 800px; /* Эффект глубины */
		}

		td {
			width: 120px;
			height: 120px;
			background: rgba(20, 20, 20, 0.9); /* Полупрозрачный черный фон */
			color: #fff;
			font-size: 32px;
			font-weight: bold;
			border: 1px solid #0ff; /* Неоновая рамка */
			box-shadow:
					0 0 10px #0ff, /* Сияние */
					0 0 20px rgba(0, 255, 255, 0.6),
					inset 0 0 10px rgba(255, 255, 255, 0.2); /* Внутреннее свечение */
			border-radius: 10px; /* Скругленные углы */
			text-align: center;
			vertical-align: middle;
			transition: transform 0.3s ease, background 0.3s ease;
		}

		td:hover {
			transform: translateY(-10px) scale(1.05); /* Подъем при наведении */
			background: rgba(40, 40, 40, 0.9); /* Изменение фона */
			box-shadow:
					0 0 15px #0ff,
					0 0 30px rgba(0, 255, 255, 0.8),
					inset 0 0 15px rgba(255, 255, 255, 0.3);
			cursor: pointer;
		}

		td:active {
			transform: translateY(0) scale(0.95); /* Нажатие */
			box-shadow:
					0 0 5px #0ff,
					0 0 10px rgba(0, 255, 255, 0.5);
		}
	</style>
</head>
<body>

<h1>Tic-Tac-Toe</h1>

<table>
	<tr>
		<td onclick="window.location='/logic?click=0'">${data.get(0).getSign()}</td>
		<td onclick="window.location='/logic?click=1'">${data.get(1).getSign()}</td>
		<td onclick="window.location='/logic?click=2'">${data.get(2).getSign()}</td>
	</tr>
	<tr>
		<td onclick="window.location='/logic?click=3'">${data.get(3).getSign()}</td>
		<td onclick="window.location='/logic?click=4'">${data.get(4).getSign()}</td>
		<td onclick="window.location='/logic?click=5'">${data.get(5).getSign()}</td>
	</tr>
	<tr>
		<td onclick="window.location='/logic?click=6'">${data.get(6).getSign()}</td>
		<td onclick="window.location='/logic?click=7'">${data.get(7).getSign()}</td>
		<td onclick="window.location='/logic?click=8'">${data.get(8).getSign()}</td>
	</tr>
</table>
<hr>
<c:set var="CROSSES" value="<%=Sign.CROSS%>"/>
<c:set var="NOUGHTS" value="<%=Sign.NOUGHT%>"/>

<c:if test="${winner == CROSSES}">
	<h1>CROSSES WIN!</h1>
	<button onclick="restart()">Start again</button>
</c:if>
<c:if test="${winner == NOUGHTS}">
	<h1>NOUGHTS WIN!</h1>
	<button onclick="restart()">Start again</button>
</c:if>
<c:if test="${draw}">
	<h1>IT'S A DRAW</h1>
	<br>
	<button onclick="restart()">Start again</button>
</c:if>
<script>
	function restart() {
		$.ajax({
			url: '/restart',
			type: 'POST',
			contentType: 'application/json;charset=UTF-8',
			async: false,
			success: function () {
				location.reload();
			}
		});
	}
</script>

</body>
</html>