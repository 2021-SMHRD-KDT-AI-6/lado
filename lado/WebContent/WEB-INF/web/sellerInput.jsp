<%@page import="kr.smhrd.model.sellerVO"%>
<%@page import="kr.smhrd.model.UserVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<%
     String cpath=request.getContextPath(); // /m02
     UserVO user=(UserVO)session.getAttribute("succ");
     sellerVO seller=(sellerVO)session.getAttribute("succ2");

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
                <div class="breadcrumb__text1">
                    <h2>?????? ?????? ??????</h2>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- Breadcrumb End -->
   
   
   
   
   
   
   
 
	<div id="qnb" class="quick-navigation" style="top: 70px;">
		<div class="type_form item_input">
			<form action="<%=cpath%>/fileUpload.do" method="post" enctype="multipart/form-data" >
        		<p class="page_sub"><span class="ico">*</span>??????????????????</p>
      
				<table class="tbl_comm">
        			<tbody>
        				<tr class="fst">
        			        <td>????????? ?????????<span>*<span class="screen_out">????????????</span></span></td>
        			        <td><input type="text" name="item_name"></td>
						</tr>
						
						<tr>
							<td>?????????<span>*<span class="screen_out">????????????</span></span></td>
							<td><input type="text" name="item_company"></td>							
						</tr>
        					
						<tr>
							<td>??????<span>*<span class="screen_out">????????????</span></span></td>
							<td><input type="number" name="item_price"></td>
						</tr>
						<tr>
							<td>????????? ?????????<span>*<span class="screen_out">????????????</span></span></td>
							<td><input type="number" name="item_serve"></td>
						</tr>
						<tr>
							<td>????????? ?????????<span>*<span class="screen_out">????????????</span></span></td>
							<td><input type="number" name="item_time"></td>
						</tr>
						<tr>
							<td>????????? ?????????<span>*<span class="screen_out">????????????</span></span></td>
							<td><input type="number" name="item_gram"></td>
						</tr>
						<tr>
							<td>????????? ?????????<span>*<span class="screen_out">????????????</span></span></td>
							<td><input type="file" name="file"></td>
						</tr>
						<tr>
							<td><input type="submit" value="????????????"></td>
						</tr>
						<tr>							
							<td><input type="hidden" name="seller_num" value="<%=seller.getSeller_num()%>"></td>
						</tr>
         					
      

       <img id="id_check_sucess" style="display: none;">
        <p class="txt_guide square">
        <span class="txt txt_case1">6??? ????????? ?????? ?????? ????????? ????????? ??????</span>
        </p>
        </td>
        </tr>
        <tr>
        <th>????????????<span class="ico">*<span class="screen_out">????????????</span></span></th>
        <td>
        <input type="password" name="user_pwd" required="" fld_esssential="" option="regPass" label="????????????" maxlength="16" class="reg_pw" placeholder="??????????????? ??????????????????">
        <p class="txt_guide square">
        <span class="id_input_re1"></span>
        <span class="id_input_re1"></span>
        <span class="txt txt_case3"></span>
        </p>
        </td>
        </tr>
        <tr class="member_pwd">
        <th>??????????????????<span class="ico">*<span class="screen_out">????????????</span></span></th>
        <td>
        <input type="password" name="user_pwd_ck" required="" fld_esssential="" option="regPass" label="????????????" maxlength="16" class="confirm_pw" placeholder="??????????????? ?????? ??? ??????????????????">
        <p class="txt_guide square">
        <span class="txt txt_case1">????????? ??????????????? ??????????????????.</span>
        </p>
        </td>
        </tr>
        <tr>
        <th>??????<span class="ico">*<span class="screen_out">????????????</span></span></th>
        <td>
        <input type="text" name="user_name" value="" required="" fld_esssential="" label="??????" placeholder="????????? ??????????????????">
        </td>
        </tr>
        <tr>
        
        
        </tr>
        <tr class="field_phone">
        
        
        </tr>
        <tr>
        
        
        </tr>
        <tr class="select_sex">
        
        <td>
        
        
        
        </td>
        </tr>
        

        <tr class="gneder">
            <th>??????</th>
            <td style="color: black;">
            
               <label class="gender_label">
                  <input type="radio" name="user_gender" value="man"  style="padding:20px;">
                  <span class="ico"></span>
                  ?????????????????????
                  
               </label>
      
               <label class="gender_label">
                    <input type="radio" name="user_gender" value="woman">
                  <span class="ico" ></span>
                  ??????
               </label>                          
            
             
     
            </td>
            </tr>
    
    
    
    
        <tr class="age">
        <th>??????</th>
        <td>
            <input type="text" name="user_age" value="" required="" fld_esssential="" label="??????" placeholder="????????? ??????????????????">
        <div class="age">
        
        <span class="bar"></span>
        
        
        
        </div>
        <p class="txt_guide">
        <span class="txt bad"></span>
        </p>
        </td>
        </tr>
        <tr class="route" id="selectRecommend">
        
        
        </tr>
        </tbody></table>
        <div id="formSubmit" class="form_footer">
        <button type="submit" class="btn active btn_join">????????????</button>
        </div>
        </form>
        </div>
       
       
        </div>
        </div>
    
        
        
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
        
        
        
      


</script>
</body>
</html>