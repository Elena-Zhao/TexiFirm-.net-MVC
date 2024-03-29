﻿<%@ Page Language="C#" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<%@ Import Namespace="TaxiFirm.Models.Notice" %>
<%@ Import Namespace="TaxiFirm.Models" %>
<!DOCTYPE html>
<!--[if IE 8 ]><html class="ie ie8" lang="en"> <![endif]-->
<!--[if (gte IE 9)|!(IE)]><!--><html lang="en"> <!--<![endif]-->
<head>

<!-- Basic Page Needs
================================================== -->
<meta charset="utf-8">
<title>Taxi Firm Server</title>

<!-- Mobile Specific Metas
================================================== -->
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">

<!-- CSS
================================================== -->
<link rel="stylesheet" href="../../Content/css/FrontPage/style.css">
<link rel="stylesheet" href="../../Content/css/FrontPage/colors/blue.css" id="colors">
<link rel="shortcut icon" href="../../Content/favicon.ico" type="image/x-icon" />
<!--[if lt IE 9]>
	<script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
<![endif]-->
<!-- Java Script
================================================== -->
<script src="../../Scripts/FrontPage/jquery.min.js"></script>
<script src="../../Scripts/FrontPage/jquery-ui.min.js"></script>
<script src="../../Scripts/FrontPage/jquery.flexslider.js"></script>
<script src="../../Scripts/FrontPage/jquery.selectnav.js"></script>
<script src="../../Scripts/FrontPage/jquery.twitter.js"></script>
<script src="../../Scripts/FrontPage/jquery.modernizr.js"></script>
<script src="../../Scripts/FrontPage/jquery.easing.1.3.js"></script>
<script src="../../Scripts/FrontPage/jquery.contact.js"></script>
<script src="../../Scripts/FrontPage/jquery.isotope.min.js"></script>
<script src="../../Scripts/FrontPage/jquery.jcarousel.js"></script>
<script src="../../Scripts/FrontPage/jquery.fancybox.min.js"></script>
<script src="../../Scripts/FrontPage/jquery.layerslider.min.js"></script>
<script src="../../Scripts/FrontPage/custom.js"></script>

<script src='../../google_analytics_auto.js'></script></head>
<%
    Notice notice = (Notice)ViewData["notice"];
    int notice_id = (int)ViewData["Current_Notice_id"];
    List<int> id_list = (List<int>)ViewData["notice_id_list"];
    NoticeHandle handler = new NoticeHandle();
    int prev_id;
    int next_id;
     %>
<body>

<!-- Wrapper / Start -->
<div id="wrapper">

<!-- Header
================================================== -->
<div id="top-line"></div>

<!-- 960 Container -->
<div class="container">

	<!-- Header -->
	<header id="header">
    <%Identity current = Identity.unlegal;
  if (Session["Identity"] != null)
  {
      current=(Identity)Session["Identity"]; 
  }%>
		<!-- Logo -->
		<div class="ten columns">
			<div id="logo">
				<h1><a href="#"><img src="../../Content/picture/FrontPage/logo.png" alt="Nevia Premium Template" height="62" /></a></h1>
				<div id="tagline">欢迎使用出租车信息管理系统</div>
				<div class="clearfix"></div>
			</div>
		</div>

		<!-- Social / Contact -->
		<div class="six columns">

			<!-- Social Icons -->
	

			<div class="clearfix"></div>
			<br/>
            <br/>
			<!-- Contact Details -->
			<div class="contact-details">联系电话: +86 131 6293 7287</div>

			<div class="clearfix"></div>

			<!-- Search -->
			<nav class="top-search">
              <%if(current==Identity.unlegal){ %>
                <a class="button color medium" href="/FrontPage/Login"  rel="register" >
                
                	<i class="icon-cloud white"></i>注册
                </a>
               
				<a class="button color medium" href="/FrontPage/Login">
                	<i class="icon-user white"></i>
                   登录
                     </a>
                    <%}
                   else if (current == Identity.manager)
                   { 
                       %> 
                     <a class="button color medium"   href="/Home/Index">
                	<i class="icon-user white"></i>后台
                     </a>
               
			
                   <a class="button color medium" href="/Home/BackHandle?type=logout">
                	<i class="icon-user white"></i>
                    注销
                     </a>
               <%}else if(current==Identity.custemer) {%>
                  <a class="button color medium"   href="/FrontPage/ChangerPassword">
                	<i class="icon-user white"></i>改密
                     </a>
               
			
                   <a class="button color medium" href="/Home/BackHandle?type=logout">
                	<i class="icon-user white"></i>
                    注销
                    </a>
               <%}%>
			</nav>

		</div>
	</header>
	<!-- Header / End -->

	<div class="clearfix"></div>

</div>
<!-- 960 Container / End -->


<!-- Navigation
================================================== -->
<nav id="navigation" class="style-1">

<div class="left-corner"></div>
<div class="right-corner"></div>

<ul class="menu" id="responsive">

<li><a href="/FrontPage/Index"><i class="halflings white home"></i> 主页</a></li>

	<li><a href="/FrontPage/News"><i class="halflings white file"></i> 新闻</a>
	</li>
	<li><a href="/FrontPage/Notification" id="current"><i class="halflings white bullhorn"></i> 通知</a>
    </li>
    <li><a href="/FrontPage/Complain"><i class="halflings white hdd"></i> 评价</a>
	</li>
	<li><a href="/FrontPage/Gallery"><i class="halflings white picture"></i> 画廊</a>
	</li>
	<li><a href="/FrontPage/Elements"><i class="halflings white road"></i> 其他</a>
	</li>
	<li><a href="/FrontPage/About"><i class="halflings white leaf"></i> 关于我们</a>
    </li>
</ul>
</nav>
<div class="clearfix"></div>

<!-- Content
================================================== -->

<div id="content">

<!-- 960 Container -->
<div class="container floated">

	<div class="sixteen floated page-title">

		<h2>通知内容 <span>/ 详细信息</span></h2>

		<!-- Portfolio Navi -->
		<div id="portfolio-navi">
			<ul>
            <%

                int index = id_list.IndexOf(notice_id);
                if (index<1)
                {
                    index = 0;
                    prev_id = id_list[index];
                    next_id = id_list[index + 1];
                }
                else if (index>(id_list.Count))
                {
                    index = id_list.Count;
                    prev_id = id_list[index - 1];
                    next_id = id_list[index];
                }
                else
                {
                    prev_id = id_list[index - 1];
                    next_id = id_list[index + 1];
                }

                 %>
                 <%if (index > 0)
                   {%>
				<li><a class="prev" href="NotificationContent?NOID=<%:prev_id %>"><b>←</b> 上一页</a></li>
                <%} if (index < id_list.Count-2)
                   {%>
				<li><a class="next" href="NotificationContent?NOID=<%:next_id %>">下一页 <b>→</b></a></li>
                <%} %>
			</ul>
		</div>
		<div class="clearfix"></div>

	</div>

</div>
<!-- 960 Container / End -->

<!-- Page Content -->
<div class="page-content">

<%
    if (notice != null)
    { %>

<!-- 960 Container -->
<div class="container" style="margin-top: 30px;">

	<div class="twelve columns">
		<p><%Response.Write(notice.notice_content); %></p>
	</div>

	<div class="four columns">
		<div class="project-info-container">
				<ul class="project-info">
				<li><strong>作者:</strong> <%:notice.author %></li>
				<li><strong>日期:</strong> <%:handler.getNoticeMonth(notice)%> <%:handler.getNoticeDay(notice)%></li>
			</ul>
		</div>
	</div>
    <%} %>
</div>
<!-- End 960 Container -->


<div class="line" style="margin: 20px 0 37px 0;"></div>


</div>
<!-- Page Content / End -->

</div>
<!-- Content / End -->

</div>
<!-- Wrapper / End -->


<!-- Footer
================================================== -->

<!-- Footer / Start -->
<footer id="footer">
	<!-- 960 Container -->
	<div class="container">

		<!-- About -->
		<div class="four columns">
			<img id="logo-footer" src="../../Content/picture/FrontPage/logo-footer.png" alt="" />
			<p>出租车管理系统由一行八人历时20天开发完成，具有独立的运作能力，可以直接投入商业化运作</p>
			
		</div>

		<!-- Contact Details -->
		<div class="four columns">
			<h4>联系方式</h4>
			<ul class="contact-details-alt">
				<li><i class="halflings white map-marker"></i> <p><strong>地址:</strong> 4800号 曹安公路,上海市嘉定区, CHA</p></li>
				<li><i class="halflings white user"></i> <p><strong>电话:</strong> +86 189 1827 1950</p></li>
				<li><i class="halflings white envelope"></i> <p><strong>Email:</strong> <a href="#">chengran327@gmail.com</a></p></li>
			</ul>
		</div>

		<!-- Photo Stream -->
		<div class="four columns">
			<h4>照片流</h4>
			<div class="flickr-widget">
				<script type="text/javascript" src="http://www.flickr.com/badge_code_v2.gne?count=6&amp;display=latest&amp;size=s&amp;layout=x&amp;source=user&amp;user=48035108@N07"></script>
				<div class="clearfix"></div>
			</div>
		</div>

		<!-- Twitter -->
		<div class="four columns">
			<h4>成员</h4>
			<ul id="facebook">
            	<li><i class="icon-group"></i>方志晗  &nbsp; &nbsp;<i class="icon-user"></i>盛雯 &nbsp; &nbsp;<i class="icon-user"></i>王成</li>
                <li></li>
                <li><i class="icon-user"></i>赵青</li>
                <li><i class="icon-user"></i>路捷</li>
                <li><i class="icon-user"></i>洪海杰</li>
                <li><i class="icon-user"></i>宁婧</li>
                <li><i class="icon-user"></i>程冉</li>
            </ul>
			<div class="clearfix"></div>
		</div>
	</div>
	<!-- 960 Container / End -->

</footer>
<!-- Footer / End -->


<!-- Footer Bottom / Start  -->
<footer id="footer-bottom">

	<!-- 960 Container -->
	<div class="container">

		<!-- Copyrights -->
		<div class="eight columns">
			<div class="copyright">
				© Copyright 2012 by <a href="#">TaxiFirm Server</a>. All Rights Reserved.
			</div>
		</div>

		<!-- Menu -->
		<div class="eight columns">
			<nav id="sub-menu">
				<ul>
					<li><a href="#">FAQ's</a></li>
					<li><a href="#">Sitemap</a></li>
					<li><a href="#">Contact</a></li>
				</ul>
			</nav>
		</div>

	</div>
	<!-- 960 Container / End -->

</footer>
<!-- Footer Bottom / End -->


<!-- Style Switcher
================================================== -->
<link rel="stylesheet" href="../../Content/css/FrontPage/switcher.css">
<script src="../../Scripts/FrontPage/switcher.js"></script>

<section id="style-switcher">
	<h2>选择样式 <a href="#"></a></h2>
	<div>
	<h3>预定颜色</h3>
		<ul class="colors" id="color1">
			<li><a href="#" class="blue" title="Blue"></a></li>
			<li><a href="#" class="green" title="Green"></a></li>
			<li><a href="#" class="orange" title="Orange"></a></li>
			<li><a href="#" class="navy" title="Navy"></a></li>
			<li><a href="#" class="yellow" title="Yellow"></a></li>
			<li><a href="#" class="peach" title="Peach"></a></li>
			<li><a href="#" class="beige" title="Beige"></a></li>
			<li><a href="#" class="purple" title="Purple"></a></li>
			<li><a href="#" class="red" title="Red"></a></li>
			<li><a href="#" class="pink" title="Pink"></a></li>
			<li><a href="#" class="celadon" title="Celadon"></a></li>
			<li><a href="#" class="brown" title="Brown"></a></li>
			<li><a href="#" class="cherry" title="Cherry"></a></li>
			<li><a href="#" class="gray" title="Gray"></a></li>
			<li><a href="#" class="dark" title="Dark"></a></li>
			<li><a href="#" class="cyan" title="Cyan"></a></li>
			<li><a href="#" class="olive" title="Olive"></a></li>
			<li><a href="#" class="dirty-green" title="Dirty Green"></a></li>
		</ul>
		
	<h3>菜单款式</h3>
	<select id="menu-style">
		<option value="1">3D特效</option>
		<option value="2">极简风格</option>
	</select>

	<h3>背景图片</h3>
		 <ul class="colors bg" id="bg">
			<li><a href="#" class="bg1"></a></li>
			<li><a href="#" class="bg2"></a></li>
			<li><a href="#" class="bg3"></a></li>
			<li><a href="#" class="bg4"></a></li>
			<li><a href="#" class="bg5"></a></li>
			<li><a href="#" class="bg6"></a></li>
			<li><a href="#" class="bg7"></a></li>
			<li><a href="#" class="bg8"></a></li>
			<li><a href="#" class="bg9"></a></li>
			<li><a href="#" class="bg10"></a></li>
			<li><a href="#" class="bg11"></a></li>
			<li><a href="#" class="bg12"></a></li>
			<li><a href="#" class="bg13"></a></li>
			<li><a href="#" class="bg14"></a></li>
			<li><a href="#" class="bg15"></a></li>
			<li><a href="#" class="bg16"></a></li>
			<li><a href="#" class="bg17"></a></li>
			<li><a href="#" class="bg18"></a></li>
		</ul>
	</div>

	<div id="reset"><a href="#" class="button color blue">重置</a></div>

</section>
<!-- Style Switcher / End -->
</body>
</html>
