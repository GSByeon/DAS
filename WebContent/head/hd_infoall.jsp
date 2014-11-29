<%@page import="java.util.Calendar"%>
<%@page import="spring.emp.DayDTO"%>
<%@page import="java.util.List"%>
<%@page import="spring.emp.EmpDTO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<jsp:include page="../template/HeadTagSetting.jsp" flush="true"/>
		<title>Employee main</title>
		<script type="text/javascript" src="../js/jquery-1.9.1.js"></script>
	</head>
	<%
	
		List <EmpDTO> list = (List)request.getAttribute("list");
		List <String> depno = (List)request.getAttribute("depno");
		List <String> jobno = (List)request.getAttribute("jobno");

	%>
	<body>
		<div class="container-fluid">
			<jsp:include page="../template/TopTemplate.jsp" flush="true"/>
			<div class="row">
			
				<div class="span3">
					<jsp:include page="../template/head/hd_menu.jsp"/>
				</div>
				<div class="span9">
					<h1>�μ��� ���� ��ȸ</h1> <br/>			
					<table class="table">
						<tr>
							<td>���</td>
							<td>�̸�</td>
							<td>�μ�</td>
							<td>����</td>
						</tr>
										<%		
					int totalRecSu = (Integer)request.getAttribute("totalRecord");	
					int recSu = 7;
					int totalPage = (int)Math.ceil((double)totalRecSu/recSu);
					int nowPage=0;
					if(request.getParameter("nowPage")!=null)
						nowPage = Integer.parseInt(request.getParameter("nowPage"));
					
					int beginPage = nowPage* recSu;		

						for(int i=beginPage; i<(beginPage + recSu); i++)
						{
							
							if(i==totalRecSu) break;	
									
							%>
								<tr>
								
								<td><%=list.get(i).getEmp_no()%></td>
								<td><%=list.get(i).getEmp_name() %></td>
								<td><%=depno.get(i)%></td>
								<td><%=jobno.get(i)%></td>
								</tr>
					
							</tr>
							<%
						}
						
						%>
										
						<tr>			
						<td colspan="4" align="right">
						<%if(totalRecSu != 0) {
							for(int i=0; i<totalPage; i++) {
								%><a href="./infoall.go?nowPage=<%=i%>&totalRec=<%=totalRecSu%>">
									<%=i + 1%>
								</a>	
							<% }
							}else{out.println("��ϵ� �Խù��� �����ϴ�.");}%>
						</td>
						</tr>	
										
						</table>
				</div>
		
			</div>
	</body>
</html>