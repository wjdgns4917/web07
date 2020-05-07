   <%@include file="../header.jsp" %>
   <%@include file="sub_img.jsp" %>
   <%@include file="sub_menu.jsp" %>
   
<%@page import="java.sql.*"%>
<%
String sql="select * from notices order by to_number(seq) desc";
//db connect
//드라이버 로드
Class.forName("oracle.jdbc.driver.OracleDriver");
//접속
String url="jdbc:oracle:thin:@localhost:1521:orcl";
String user="scott";
String pw="123456";
Connection conn=DriverManager.getConnection(url, user, pw);
//실행
Statement st=conn.createStatement();
//결과
ResultSet rs=st.executeQuery(sql);
%> 
        <article>
        <h1>Notice</h1>
             
<table id="notice">
  <tr>
    <th scope="col" class="tno">no.</th>
    <th scope="col" class="ttitle">title</th>
    <th scope="col" class="twrite">writer</th>
    <th scope="col" class="tdate">date</th>
    <th scope="col" class="tread">read</th>
  </tr>
  <%
	while(rs.next()){
	%>
	<tr>
		<td><%=rs.getString("seq")%></td>
		<td> <a href="noticeDetail.jsp?c=<%=rs.getString("seq")%>"><%=rs.getString("title")%></a> </td>
		<td><%=rs.getString("writer")%></td>
		<td><%=rs.getDate("regdate")%></td>
		<td><%=rs.getInt("hit")%></td>
	</tr>
	<%
	}
	%>
                    
</table>

<div id="table_search">
<input name="" type="text" class="input_box">
<input type="button" value="Search" class="btn">
</div>
 <div class="clear"></div>
 
<div id="page_control">
<a href="#">Prev</a> <a href="#">1</a> <a href="#">2</a> <a href="#">3</a> <a href="#">4</a> <a href="#">5</a> <a href="#">6</a> <a href="#">7</a> <a href="#">8</a> <a href="#">9</a> <a href="#">10</a>  <a href="#">Next</a></div>         
            
        </article>
    <%@include file="../footer.jsp" %>  
        
