<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@page import="QnA.QnABean" %>
    <%
    int idx=Integer.parseInt(request.getParameter("idx"));
    String nowPage=request.getParameter("nowPage");
    QnABean bean=(QnABean)session.getAttribute("bean");
    String title=bean.getTitle();
    String contents=bean.getContents();
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1" />
<link rel="stylesheet" href="assets/css/main.css" />
<link href="//fonts.googleapis.com/css?family=Pattaya&subset=latin"
	rel="stylesheet" type="text/css">
		<link rel="icon" type="image/png" href="images/icons/favicon_main.ico"/>
<title>QnA ���� : Tomorrow is...</title>
<script type="text/javascript">

function check() {
	
	if (document.getElementById("title").value=="") {
		alert("������ �Է����ּ���");
		document.getElementById("title").focus();
		return false;
	}
	if (document.getElementById("contents").value=="") {
		alert("������ �Է����ּ���.");
		document.getElementById("contents").value = "";
		document.getElementById("contents").focus();
		return false;
	}
	if(<%=bean.getSecret()%>==1){
		if(document.getElementById("pwd").value.length !=4)
		{
			alert("��й�ȣ�� 4�ڸ��� �Է����ּ���.");
			document.getElementById("pwd").value = "";
			document.getElementById("pwd").focus();
			return false;
		}
		}
	
}

function logout()
{
	if(confirm("�α׾ƿ� �Ͻðڽ��ϱ�?")==true)
{

	location.href="logout.jsp";
}
	else
{
	return;
}
}
</script>
</head>
<body>
<!-- Header -->
	<header id="header">
	<div class="inner">
		<a href="Home.jsp" class="logo">Tomorrow is...</a>
			<a href="1.receiveWorry.jsp">���� ������</a>
						<a href="1.sendWorry.jsp">���� ������</a>
						<a href="2.answer.jsp">To.������ ��</a>
						<a href="3.QnA.jsp">QnA</a>
		<a href="4.notice_list.jsp">Notice</a>
		<%
			if (!(session.getAttribute("id") == null)) {
		%> <a href="javascript:logout()"><font color="red">Logout</a> </font> <%
 	}
 %> 
		<a href="#navPanel" class="navPanelToggle"><span
			class="fa fa-bars"></span></a>
	</div>
	</header>
		
<!-- Banner -->
		<section id="banner">
		<div class="inner">
			<div class="flex">
				<div>
					<img src="images/icons/question.png" width="30px" /><br><br>
							<h3>QnA</h3>
							<p>��, ���ǻ��׿��� ������ �� �� �� ������ �����̱���?<br>
							 </p>
						
					</p>
				</div>
			</div>
		</div>
		</section>
<br><br><br>
<form name="updqteFrm" method="post" action="3.QnAUpdateProcess.jsp" onsubmit="check()">
<input type="hidden" name="nowPage" value="<%=nowPage %>">
<input type="hidden" name="idx" value="<%=idx%>">
<input type="hidden" name="depth" value="<%=bean.getDepth()%>">

				<div class="inner">
			<div class="field">
					
					<label for="name">���� ����(����)</label>
					<textarea rows="3" cols="250" name="title" id="title"><%=bean.getTitle()%></textarea>
				<br><br>
					<label for="name">���� ����(����)</label>
					<td><textarea rows="10" cols="250" name="contents"
							id="contents"><%=bean.getContents()%></textarea>
			
				<%if((bean.getSecret()==1) && !session.getAttribute("id").equals("rhksflwk")) {%>
				<br><br>
				<p align="center"><input type="password" id="pwd" name="pwd" style="width:30%;"><br>��й�ȣ 4�ڸ��� �Է����ּ���</p>
				
				<%} %>

		
			<center>
			
					<br> <br>
				<div class="Button">
				<input type="submit" value="�����ϱ�">
				<input type="button" value="���ư���" onclick="location.href='3.QnARead.jsp?idx=<%=idx%>'">
				</div>

			</center>
		</div>
		</form>
		
			<script type="text/javascript">
		window.history.forward();
		function noBack() {
			window.history.forward();

		}

         </script>
</body>
</html>