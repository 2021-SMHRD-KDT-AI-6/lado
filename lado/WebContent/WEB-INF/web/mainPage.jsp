<%@page import="kr.smhrd.model.itemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>

<%
    String cpath=request.getContextPath(); // /m02
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
	<header id="header">
        <div class="headbox">
            <nav class=""> <!--���� �������� �ٸ� ���������� ��ũ�� �����ִ� ��ȹ-->
                <div class="">
                    <h1 class="site_logo">
                        <a href="" class="">
                            <img src="" alt="">
                        </a>
                    </h1>
                    <div class="menu_list_wrap">
                        <button class="menu_list">
                            <span class="icon"></span>
                        </button>
                    </div>
                    <div class="menu_list_ihnner">
                        <div>
                            <img class="" src="">
                            <ul class="menu_list"></ul>
                                <li>
                                    <a href="<%=cpath%>/itemList.do">Menu</a>
                                </li>
                                <li>
                                    <a href="" onclick="">About Us</a>
                                </li>
                                <li>
                                    <a href="" onclick="">My Page</a>
                                </li>
                                <li>
                                    <a href="" onclick="">Cart</a>
                                </li>
                                <li>
                                    <a href="<%=cpath%>/signUp.do">ȸ������</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                </div>
            </nav>
            <div class="header-contents">
                <h2>
                    ���ִ� ��ŰƮ
                    <br>
                    ���缺���� ����?
                </h2>
                <p>
                    ���� �츮������ ���� ���� ��ŰƮ,
                    <br>
                    ���� ã�ƺ���!
                </p>
            </div>
            <main>
                <section></section>
            </main>
        </div>
    </header>
    <footer id="footer" class="">
        <address class="content">
            <h4>Lado a Lado</h4>
            <p>
                (��)�󵵾��
                <em>|</em>
                <span>����ڹ�ȣ : 128-31-00321</span>
                <em>|</em>
                <span>��ǥ : ���</span>
            </p>
            <p>
                <span>���ֱ����� ���� �۾Ϸ�60, CGI���� 201ȣ</span>
            </p>
    </footer>
</body>
</html>