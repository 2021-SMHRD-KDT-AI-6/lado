<%@page import="kr.smhrd.model.itemVO"%>
<%@page import="kr.smhrd.model.sellerVO"%>
<%@page import="kr.smhrd.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
     String cpath=request.getContextPath(); // /m02
     UserVO user=(UserVO)session.getAttribute("succ");
     sellerVO seller=(sellerVO)session.getAttribute("succ2");
     itemVO vo = (itemVO) request.getAttribute("vo");
%>    

    <script type="text/javascript">
  	function outFn(){
  		location.href="<%=cpath%>/logout.do"
  	}
  	
  	src="<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"
  </script>
<!DOCTYPE html>
<html lang="en">
<head>


  

    <!-- Google Font -->
    <link href="https://fonts.googleapis.com/css2?family=Playfair+Display:wght@400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@300;400;500;600;700;800;900&amp;display=swap" rel="stylesheet">
    
    <!-- Css Styles -->
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/member1.css">
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/common.css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/flaticon.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/barfiller.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/magnific-popup.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/font-awesome.min.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/elegant-icons.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/nice-select.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/owl.carousel.min.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/slicknav.min.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css" type="text/css">
      <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style1.css" type="text/css">
     <script src= "<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
     	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>

<body>

<!-- Header Section Begin -->
    <header class="header">
        <div class="header__top">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="header__top__inner">
                            <div class="header__top__left">
                                <ul>                                                                  
                                    <li><a href="<%=cpath%>/signUp.do">Join</a></li>
                                    <li><a href="<%=cpath%>/SellersignUp.do">Join-Seller</a></li>
                                </ul>
                            </div>
                            <div class="header__logo">                                                              
                            	<a href="<%=cpath%>/mainPage.do"><img src="img/logo.png" alt=""></a>                               
                            </div>
                            <div class="header__top__right">
                                <ul>                                                                
                                    <li>
										<% if(user==null&seller==null){ %>
                                    	<p>Please Login</p>
										<% } else{ %>
			                            <% if(user!=null){ %>
			                            <%= user.getUser_name() %>??? ????????? ???????????????.
			                            <a class="loginout" onclick="outFn()">Logout</a>
			                            <% }else if(seller!=null){ %>
			                            <%= seller.getSeller_id() %>??? ????????? ???????????????.
			                            <a class="loginout" onclick="outFn()">Logout</a>
			                            <% }
			                            }%>
                                    </li>
                                </ul>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="canvas__open"><i class="fa fa-bars"></i></div>
            </div>
        </div>
        
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <nav class="header__menu mobile-menu">
                        <ul>
                            <li><a href="<%=cpath%>/mainPage.do">???</a></li>
                            <li><a href="<%=cpath%>/aboutUs.do">???????????????</a></li>
                            <li><a href="<%=cpath%>/itemList.do">??????</a></li>
                                    
								<%if(user == null && seller==null){ %> 
								<li><a href="<%=cpath%>/loginPage.do" class="loginout">?????????</a></li> 
								<%}else if(user != null){ %>
								<li>
								<form action="<%=cpath%>/cartView.do" method="post">
									<input type="hidden" name="user_num" value="<%=user.getUser_num()%>"> 
									<input type="submit" id="seller_pd" value="????????????" />
								</form> 
								</li>
								<% }else if(seller != null){ %>
								<li>
								<form action="<%=cpath%>/input.do" method="post">
									<input type="hidden" name="seller_num" value="<%=seller.getSeller_num()%>"> 
									<input type="submit" id="seller_pd" value="????????????" />
								</form> 
								</li>
								<li>
								<form action="<%=cpath%>/manageItem.do" method="post">
									<input type="hidden" name="seller_num" value="<%=seller.getSeller_num()%>"> 
									<input type="submit" id="seller_pd" value="????????????" />
								</form> 
								</li>
							    <% } %>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </header>
<!-- Header Section End -->
    
   <!-- Breadcrumb Begin -->
<div class="breadcrumb-option">
    <div class="container">
        <div class="row">
            <div class="col-lg-6 col-md-6 col-sm-6">
                <div class="breadcrumb__text">
                    <h2>???????????? ??????</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->
   
<div id="qnb" class="quick-navigation" style="top: 70px;">
	<div class="type_form member_join ">
        <form id="form" method="post" action="<%=cpath%>/inputIngredient.do">
        	<p class="page_sub"><span class="ico">*</span>??????????????????</p>
        	
        	<table class="tbl_comm">
        		<tbody>
        			<tr class="fst">
           				<th>?????????<span>*<span class="screen_out">????????????</span></span></th>
        				<td>
         					<input type="text" name="item_name" value="<%=vo.getItem_name()%>">
         				</td>
        			</tr>
        			
        			<tr class="fst">
           				<th>?????????<span>*<span class="screen_out">????????????</span></span></th>
        				<td>
         					<input type="text" name="item_company" value="<%=vo.getItem_company()%>">
         				</td>
        			</tr>
        			
        			<tr class="fst">
           				<th>??????<span>*<span class="screen_out">????????????</span></span></th>
        				<td>
         					<input type="text" name="item_price" value="<%=vo.getItem_price()%>">
         				</td>
        			</tr>
        			
        			<tr class="fst">
           				<th>??????<span>*<span class="screen_out">????????????</span></span></th>
        				<td>
         					<input type="text" name="item_serve" value="<%=vo.getItem_serve()%>">
         				</td>
        			</tr>
        			
        			<tr class="fst">
           				<th>????????????<span>*<span class="screen_out">????????????</span></span></th>
        				<td>
         					<input type="text" name="item_time" value="<%=vo.getItem_time()%>">
         				</td>
        			</tr>
        			
        			<tr class="fst">
           				<th>??????<span>*<span class="screen_out">????????????</span></span></th>
        				<td>
         					<input type="text" name="item_gram" value="<%=vo.getItem_gram()%>">
         				</td>
        			</tr>
        			
        			<tr class="fst">
           				<th>??????<span>*<span class="screen_out">????????????</span></span></th>
        				<td><input type="file" name="file"></td>
        			</tr>
			</tbody>
        </table>
        
        
        <div id="formSubmit" class="form_footer">
        	<button type="submit" class="btn active btn_join" onclick="<%=cpath%>/inputIngredient.do">?????? ???</button>
        </div>
		</form>
			<h1>???</h1>
			<h1>???</h1>
			<h1>???</h1>
	</div>
</div>

<!-- Footer Section Begin -->
    <footer class="footer set-bg">
        <div class="container">
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="footer__about">
                        <div class="footer__logo">
                            <a href="#"><img src="img/footer-logo.png" alt=""></a>
                        </div>
                        <p>If you want to know <br>more about our company and products, please check the SNS below.</p>
                        <div class="footer__social">
                            <a href="#"><i class="fa fa-facebook"></i></a>
                            <a href="#"><i class="fa fa-twitter"></i></a>
                            <a href="#"><i class="fa fa-instagram"></i></a>
                            <a href="#"><i class="fa fa-youtube-play"></i></a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</footer>
</body>
</html>