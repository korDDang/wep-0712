<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적입력</title>
<script>
function check() {
	var doc=document.form;
	if(doc.sNo.value==""){
		alert("학번이 입력되지 않았습니다");
		doc.sNo.focus();
		return false;
	}if(doc.sName.value==""){
		alert("성명이 입력되지 않았습니다");
		doc.sName.focus();
		return false;
	}if(doc.kor.value==""){
		alert("국어점수가 입력되지 않았습니다");
		doc.kor.focus();
		return false;
	}if(doc.eng.value==""){
		alert("영어점수가 입력되지 않았습니다");
		doc.eng.focus();
		return false;
	}if(doc.math.value==""){
		alert("수학점수가 입력되지 않았습니다");
		doc.math.focus();
		return false;
	}if(doc.hist.value==""){
		alert("역사점수가 입력되지 않았습니다");
		doc.hist.focus();
		return false;
	}else{
		doc.submit();
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section id="sec1">
<br>
<h2>학생 성적 입력</h2>
<br>
<form name="form" method="post" action="insertProcess.jsp">
<table border="1" id="tab1">
<tr>
	<th>학번</th>
		<td> <input type="text" name="sNo"> </td>
</tr>
<tr>
	<th>성명</th>
		<td> <input type="text" name="sName"> </td>
</tr>
<tr>
	<th>국어</th>
		<td> <input type="text" name="kor"> </td>
</tr>
<tr>
	<th>영어</th>
		<td> <input type="text" name="eng"> </td>
</tr>
<tr>
	<th>수학</th>
		<td> <input type="text" name="math"> </td>
</tr>
<tr>
	<th>역사</th>
		<td> <input type="text" name="hist"> </td>
</tr>
<tr>
<td colspan="2" class="td1">
	<input type="button" value="성적저장" onclick="check()">
	</td>
	</tr>
</table>
</form>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>