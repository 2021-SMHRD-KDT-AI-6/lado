<%@page import="kr.smhrd.model.itemVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    
<%
    // Object Cating(��ü����ȯ-�����߿�)
    ArrayList<itemVO> list=(ArrayList<itemVO>)request.getAttribute("list");
    String cpath=request.getContextPath(); // /m02
    
    
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>


    <!--�޴� ī�װ� ����-->
    <div class="">
        <div class="menupackage">
            <div class="category_title">
                <p class="banner"></p>
                <div style="width:100%; height:40px; display:block;"></div>
                <h2>
                    <span>��ŰƮ</span>
                </h2>
            </div>
            <div>
                <ul class="menu_category">
                    <li class="">�ѽ�</li>
                    <li class="">�Ͻ�</li>
                    <li class="">�߽�</li>
                    <li class="">���</li>
                </ul>
            </div>
        </div>
    </div>
    <!--�޴� ī�װ� ����-->

    <!--��ǰ ���� ����-->
    <div class="product_list">
        <ul class="product_list_grid">
        <% for(itemVO vo : list){ %>
            <li class="item">
                <div class=thumbnail>
                    <div class="">
                        <a href="<%=cpath%>/itemContent.do?item_num=<%=vo.getItem_num()%>">
                            <img src="#">
                        </a>
                    </div>
                </div>
                <div class="product_description">
                    <strong class="product_spec">
                        <a href="<%=cpath%>/itemContent.do?item_num=<%=vo.getItem_num()%>"><h3><%=vo.getItem_name()%></h3></a>
                        <h4><%=vo.getItem_price()%>��</h4>
                        <h4><%=vo.getItem_company()%></h4>
                    </strong>
                </div>
            </li>
            <%   }  %>
        </ul>
        
    </div>






<!--  
	<table>
		   <tr>
		     <td>��ȣ</td>
		     <td>��ŰƮ�̸�</td>  
		     <td>������</td>
		     <td>����</td>
		     <td>�뷮</td>
		     <td>�κ� ��</td>
		     <td>�����ð�</td>
		     <td>�����</td>
		     <td>�Ǹ��ڹ�ȣ</td>
		   </tr>
		   <% for(itemVO vo : list){  %>
		   <tr>
		     <td><%=vo.getItem_num()%></td>
		     <td><a href="<%=cpath%>/itemContent.do?item_num=<%=vo.getItem_num()%>"><%=vo.getItem_name()%></a></td>
		     <td><%=vo.getItem_company()%></td>
		     <td><%=vo.getItem_price()%></td>
		     <td><%=vo.getItem_gram()%></td>
		     <td><%=vo.getItem_serve()%></td>
		     <td><%=vo.getItem_time()%></td>
		     <td><%=vo.getReg_date()%></td>
		     <td><%=vo.getSeller_num()%></td>
		   </tr>   
		   <%   }  %>
		   
		</table>
-->
</body>
</html>