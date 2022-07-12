<%@page import="java.text.DecimalFormat" %>
<%@page import="java.sql.SQLException"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>성적조회</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<%@ include file="DBConn.jsp" %>
<section id="sec1">
<br>
<h2>성적조회목록</h2>
<br>
<hr>
<table border="1" id="tab1">
<tr>
<th>학년</th>
<th>반</th>
<th>번호</th>
<th>성명</th>
<th>국어</th>
<th>영어</th>
<th>수학</th>
<th>역사</th>
<th>총점</th>
<th>평균</th>
</tr>
<%
DecimalFormat fo=new DecimalFormat("0.###");
int sum=0;
double cnt=0;
int korsum=0;
int engsum=0;
int mathsum=0;
int histsum=0;
int sumsum=0;
double cntsum=0;
double korcnt=0;
double engcnt=0;
double mathcnt=0;
double histcnt=0;
double sumcnt=0;
double cntcnt=0;
try{
	String sql="select * from score0712 order by sNo";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
		String sNo=rs.getString(1);
		String sNo1=sNo.substring(0,1);
		String sNo2=sNo.substring(1,3);
		String sNo3=sNo.substring(3,5);
		String sName=rs.getString(2);
		int kor=rs.getInt(3);
		int eng=rs.getInt(4);
		int math=rs.getInt(5);
		int hist=rs.getInt(6);
		sum=kor+eng+math+hist;
		cnt=((double)kor+(double)eng+(double)math+(double)hist)/4;
		korsum+=kor;
		engsum+=eng;
		mathsum+=math;
		histsum+=hist;
		sumsum+=sum;
		cntsum+=cnt;
		korcnt++;
		
		
%>

<tr>
<td class="td1"><%=sNo1 %></td>
<td class="td1"><%=sNo2 %></td>
<td class="td1"><%=sNo3 %></td>
<td class="td1"><%=sName %></td>
<td class="td2"><%=kor %></td>
<td class="td2"><%=eng %></td>
<td class="td2"><%=math %></td>
<td class="td2"><%=hist %></td>
<td class="td2"><%=sum %></td>
<td class="td2"><%=fo.format(cnt) %></td>
</tr>
<%

}
}catch(SQLException e){
e.printStackTrace();
System.out.println("조회 실패");
}
try{
	String sql="select avg(kor),avg(eng),avg(math),avg(hist) from score0712";
	pstmt=conn.prepareStatement(sql);
	rs=pstmt.executeQuery();
	while(rs.next()){
	korcnt=rs.getDouble(1);
	engcnt=rs.getDouble(2);
	mathcnt=rs.getDouble(3);
	histcnt=rs.getDouble(4);
	sumcnt=korcnt+engcnt+mathcnt+histcnt;
	cntcnt=(korcnt+engcnt+mathcnt+histcnt)/4;
	}
}catch(SQLException e){
	System.out.println("조회실패");
	e.printStackTrace();
}
%>



<tr>
<td></td>
<td></td>
<td></td>
<td class="td1">총점</td>
<td class="td2"><%=korsum %></td>
<td class="td2"><%=engsum %></td>
<td class="td2"><%=mathsum %></td>
<td class="td2"><%=histsum %></td>
<td class="td2"><%=sumsum %></td>
<td class="td2"><%=cntsum %></td>
</tr>
<tr>
<td></td>
<td></td>
<td></td>
<td class="td1">총평균</td>
<td class="td2"><%=fo.format(korcnt) %></td>
<td class="td2"><%=fo.format(engcnt) %></td>
<td class="td2"><%=fo.format(mathcnt) %></td>
<td class="td2"><%=fo.format(histcnt) %></td>
<td class="td2"><%=fo.format(sumcnt) %></td>
<td class="td2"><%=fo.format(cntcnt) %></td>
</tr>
</table>
<hr>
</section>
<%@ include file="footer.jsp" %>
</body>
</html>