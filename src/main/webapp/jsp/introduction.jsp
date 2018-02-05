<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>商品详情页面</title>
<link href="<%=request.getContextPath()%>/css/admin.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/foot.css" rel="stylesheet" type="text/css">
<link href="<%=request.getContextPath()%>/css/amazeui.css" rel="stylesheet" type="text/css" />
<link href="<%=request.getContextPath()%>/css/demo.css" rel="stylesheet" type="text/css" />
<link type="text/css" href="<%=request.getContextPath()%>/css/optstyle.css" rel="stylesheet" />
<link type="text/css" href="<%=request.getContextPath()%>/css/style.css" rel="stylesheet" />

<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/quick_links.js"></script>

<script type="text/javascript" src="<%=request.getContextPath()%>/js/amazeui.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.imagezoom.min.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/jquery.flexslider.js"></script>
<script type="text/javascript" src="<%=request.getContextPath()%>/js/list.js"></script>
</head>
<script type="text/javascript">
	function add(sta) {
		var userId = "${user.id }";
		// 		var userId = "user";
		if (userId == "") {
			alert("请先登陆");
			window.location.href = "/st_web/jsp/login.jsp";
			return;
		}
		var comNum = parseInt($("#text_box").val());
		var comId = "${com.id }";
		$.ajax({
				url : "/st_web/" + sta + "/add.do",
				type : "POST",
				data : "comNum=" + comNum + "&comId=" + comId + "&userId=" + userId,
				dataType : "text",
				contentType : 'application/x-www-form-urlencoded; charset=UTF-8',//防止乱码
				success : function(data) {
					alert("添加成功！")
				}
			});

	}
</script>
<body>

	<%@ include file="head.jsp"%><div class="banner">
	

		<!--放大镜-->

		<div class="item-inform">
			<div class="clearfixLeft" id="clearcontent">

				<div class="box">


					<div class="tb-booth tb-pic tb-s310">
						<a href="../image/fengmian.jpg">
							<img src="${com.urla }" alt="细节展示放大镜特效" class="jqzoom" />
						</a>
					</div>
					<ul class="tb-thumb" id="thumblist">
						<li class="tb-selected">
							<div class="tb-pic tb-s40">
								<a href="#">
									<img src="${com.urlb }">
								</a>
							</div>
						</li>
						<li>
							<div class="tb-pic tb-s40">
								<a href="#">
									<img src="${com.urlc }">
								</a>
							</div>
						</li>
						<li>
							<div class="tb-pic tb-s40">
								<a href="#">
									<img src="${com.urld }">
								</a>
							</div>
						</li>
					</ul>
				</div>

				<div class="clear"></div>
			</div>

			<div class="clearfixRight">

				<!--规格属性-->
				<!--名称-->
				<div class="tb-detail-hd">
					<h1>${com.comName }</h1>
				</div>
				<div class="tb-detail-list">
					<!--价格-->
					<div class="tb-detail-price">
						<li class="price iteminfo_price">
							<dt>促销价</dt>
							<dd>
								<em>¥</em>
								<b class="sys_item_price">${com.comPrice }</b>
							</dd>
						</li>
						<li class="price iteminfo_mktprice">
							<dt>原价</dt>
							<dd>
								<em>¥</em>
								<b class="sys_item_mktprice">1860.50</b>
							</dd>
						</li>
						<div class="clear"></div>
					</div>

					<!--地址-->
					<dl class="iteminfo_parameter freight">
						<dt>配送至</dt>
						<div class="iteminfo_freprice">
							<div class="am-form-content address">
								<select data-am-selected>
									<option value="a">山东省</option>
									<option value="b">山西省</option>
								</select>
								<select data-am-selected>
									<option value="a">青岛市</option>
									<option value="b">济南市</option>
								</select>
								<select data-am-selected>
									<option value="a">城阳区</option>
									<option value="b">市南区</option>
								</select>
							</div>
							<div class="pay-logis">
								快递
								<b class="sys_item_freprice">10</b>
								元
							</div>
						</div>
					</dl>
					<div class="clear"></div>

					<!--销量-->
					<ul class="tm-ind-panel">
						<li class="tm-ind-item tm-ind-sellCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">月销量</span>
								<span class="tm-count">3</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-sumCount canClick">
							<div class="tm-indcon">
								<span class="tm-label">累计销量</span>
								<span class="tm-count">24</span>
							</div>
						</li>
						<li class="tm-ind-item tm-ind-reviewCount canClick tm-line3">
							<div class="tm-indcon">
								<span class="tm-label">累计评价</span>
								<span class="tm-count">17</span>
							</div>
						</li>
					</ul>
					<div class="clear"></div>

					<!--各种规格-->
					<dl class="iteminfo_parameter sys_item_specpara">
						<dt class="theme-login">
							<div class="cart-title">
								可选规格
								<span class="am-icon-angle-right"></span>
							</div>
						</dt>
						<dd>
							<!--操作页面-->

							<div class="theme-popover-mask"></div>

							<div class="theme-popover">
								<div class="theme-span"></div>
								<div class="theme-poptit">
									<a href="javascript:;" title="关闭" class="close">×</a>
								</div>
								<div class="theme-popbod dform">
									<form class="theme-signin" name="loginform" action="" method="post">

										<div class="theme-signin-left">

											<div class="theme-options">
												<div class="cart-title">套餐</div>
												<ul>
													<li class="sku-line selected">
														套餐一
														<i></i>
													</li>
													<li class="sku-line">
														套餐二
														<i></i>
													</li>
													<li class="sku-line">
														套餐三
														<i></i>
													</li>
												</ul>
											</div>
											<div class="theme-options">
												<div class="cart-title">版本类型</div>
												<ul>
													<li class="sku-line selected">
														3ds
														<i></i>
													</li>
													<li class="sku-line">
														NEW3ds
														<i></i>
													</li>
													<li class="sku-line">
														NEW3dsll
														<i></i>
													</li>
												</ul>
											</div>
											<div class="theme-options">
												<div class="cart-title number">数量</div>
												<dd>
													<input id="min" class="am-btn am-btn-default" name="" type="button" value="-" />
													<input id="text_box" name="" type="text" value=1 style="width: 30px;" />
													<input id="add" class="am-btn am-btn-default" name="" type="button" value="+" />
													<span id="Stock" class="tb-hidden">
														库存
														<span class="stock" id="comrep">${com.comRepository }</span>
														件
													</span>
												</dd>
											</div>
											<div class="clear"></div>
										</div>
									</form>
								</div>
						</dd>
					</dl>
					<div class="clear"></div>
					<!--活动	-->
					<div class="shopPromotion gold">
						<div class="hot">
							<dt class="tb-metatit">店铺优惠</dt>
							<div class="gold-list">
								<p>
									购物即送数据线
<!-- 									<span> -->
<!-- 										点击领券 -->
<!-- 										<i class="am-icon-sort-down"></i> -->
<!-- 									</span> -->
								</p>
							</div>
						</div>
						<div class="clear"></div>
<!-- 						<div class="coupon"> -->
<!-- 							<dt class="tb-metatit">优惠券</dt> -->
<!-- 							<div class="gold-list"> -->
<!-- 								<ul> -->
<!-- 									<li>100减5</li> -->
<!-- 									<li>500减10</li> -->
<!-- 									<li>1000减100</li> -->
<!-- 								</ul> -->
<!-- 							</div> -->
<!-- 						</div> -->
					</div>
				</div>

				<div class="pay">
					<div class="pay-opt">
						<a href="home.html">
							<span class="am-icon-home am-icon-fw">首页</span>
						</a>
						<a>
							<span class="am-icon-heart am-icon-fw">收藏</span>
						</a>

					</div>
					<li>
						<div class="clearfix tb-btn tb-btn-buy theme-login">
							<a id="LikBuy" title="点此按钮到下一步确认购买信息" onclick="add('order')">立即购买</a>
						</div>
					</li>
					<li>
						<div class="clearfix tb-btn tb-btn-basket theme-login">
							<a id="LikBasket" title="加入购物车" onclick="add('car')">
								<i></i>
								加入购物车
							</a>
						</div>
					</li>
				</div>

			</div>
		</div>
		<div class="introduceMain" style="margin-left: 18%">
			<div class="am-tabs" data-am-tabs>
				<ul class="am-avg-sm-3 am-tabs-nav am-nav am-nav-tabs">
					<li class="am-active">
						<a href="#">

							<span class="index-needs-dt-txt">宝贝详情</span>
						</a>

					</li>

					<li>
						<a href="#">

							<span class="index-needs-dt-txt">全部评价</span>
						</a>

					</li>
				</ul>

				<div class="am-tabs-bd">

					<div class="am-tab-panel am-fade am-in am-active">
						<div class="J_Brand">

							<div class="attr-list-hd tm-clear">
								<h4>产品参数：</h4>
							</div>
							<div class="clear"></div>
							<ul id="J_AttrUL">
								<li title="">产品名称:&nbsp;3DS、3DSLL</li>
								<li title="">品牌:&nbsp;任天堂</li>
								<li title="">版本类型:&nbsp;日版、美版</li>
								<li title="">产地:&nbsp;日本</li>
								<li title="">套餐:&nbsp;套餐一、套餐二、套餐三</li>
								<li title="">内存容量:&nbsp;32GB</li>
								<li title="">颜色分类:&nbsp;蓝色、白色</li>
							</ul>
							<div class="clear"></div>
						</div>

						<div class="details">
							<div class="attr-list-hd after-market-hd">
								<h4>商品细节</h4>
							</div>
							<div class="twlistNews">
								<img src="../image/xiangqing.png" />
							</div>
						</div>
						<div class="clear"></div>

					</div>

					<div class="am-tab-panel am-fade">

						<div class="actor-new">
							<div class="rate">
								<strong>
									75
									<span>%</span>
								</strong>
								<br>
								<span>好评度</span>
							</div>
							<dl>
								<dt>大家印象</dt>
								<dd class="p-bfc">
									<q class="comm-tags">
										<span>服务不错</span>
										<em>(11)</em>
									</q>
									<q class="comm-tags">
										<span>质量不错</span>
										<em>(15)</em>
									</q>
									<q class="comm-tags">
										<span>物流快</span>
										<em>(9)</em>
									</q>
									<q class="comm-tags">
										<span>便宜</span>
										<em>(2)</em>
									</q>
									<q class="comm-tags">
										<span>外观漂亮</span>
										<em>(15)</em>
									</q>
									<q class="comm-tags">
										<span>性能好</span>
										<em>(13)</em>
									</q>
								</dd>
							</dl>
						</div>
						<div class="clear"></div>
						<div class="clear"></div>
						<div class="tb-r-filter-bar">
							<ul class=" tb-taglist am-avg-sm-4">
								<li class="tb-taglist-li tb-taglist-li-current">
									<div class="comment-info">
										<span>全部评价</span>
										<span class="tb-tbcr-num">(17)</span>
									</div>
								</li>

								<li class="tb-taglist-li tb-taglist-li-1">
									<div class="comment-info">
										<span>好评</span>
										<span class="tb-tbcr-num">(15)</span>
									</div>
								</li>

								<li class="tb-taglist-li tb-taglist-li-0">
									<div class="comment-info">
										<span>中评</span>
										<span class="tb-tbcr-num">(2)</span>
									</div>
								</li>

								<li class="tb-taglist-li tb-taglist-li--1">
									<div class="comment-info">
										<span>差评</span>
										<span class="tb-tbcr-num">(0)</span>
									</div>
								</li>
							</ul>
						</div>
						<div class="clear"></div>

						<ul class="am-comments-list am-comments-list-flip">
							<li class="am-comment">
								<!-- 评论容器 -->
								<a href="">
									<img class="am-comment-avatar" src="../image/109.png" />
									<!-- 评论者头像 -->
								</a>

								<div class="am-comment-main">
									<!-- 评论内容容器 -->
									<header class="am-comment-hd">
										<!--<h3 class="am-comment-title">评论标题</h3>-->
										<div class="am-comment-meta">
											<!-- 评论元数据 -->
											<a href="#link-to-user" class="am-comment-author">a***j（匿名）</a>
											<!-- 评论者 -->
											评论于
											<time datetime="">2017年12月20日 00:54</time>
										</div>
									</header>

									<div class="am-comment-bd">
										<div class="tb-rev-item " data-id="255776406962">
											<div class="J_TbcRate_ReviewContent tb-tbcr-content ">不错，全新的手感就是好。 </div>
											<div class="tb-r-act-bar"> 套餐：套餐一  颜色分类：蓝色NEW3DSLL</div>
										</div>

									</div>
									<!-- 评论内容 -->
								</div>
							</li>
							<li class="am-comment">
								<!-- 评论容器 -->
								<a href="">
									<img class="am-comment-avatar" src="../image/109.png" />
									<!-- 评论者头像 -->
								</a>

								<div class="am-comment-main">
									<!-- 评论内容容器 -->
									<header class="am-comment-hd">
										<!--<h3 class="am-comment-title">评论标题</h3>-->
										<div class="am-comment-meta">
											<!-- 评论元数据 -->
											<a href="#link-to-user" class="am-comment-author">h***z（匿名）</a>
											<!-- 评论者 -->
											评论于
											<time datetime="">2017年12月15日 11:10</time>
										</div>
									</header>

									<div class="am-comment-bd">
										<div class="tb-rev-item " data-id="255095758792">
											<div class="J_TbcRate_ReviewContent tb-tbcr-content ">预装了许多游戏都很不错，另外老板的服务真的很好大大的赞 </div>
											<div class="tb-r-act-bar">套餐：套餐二  颜色分类：白色NEW3DSLL</div>
										</div>

									</div>
									<!-- 评论内容 -->
								</div>
							</li>
							<li class="am-comment">
								<!-- 评论容器 -->
								<a href="">
									<img class="am-comment-avatar" src="../image/109.png" />
									<!-- 评论者头像 -->
								</a>

								<div class="am-comment-main">
									<!-- 评论内容容器 -->
									<header class="am-comment-hd">
										<!--<h3 class="am-comment-title">评论标题</h3>-->
										<div class="am-comment-meta">
											<!-- 评论元数据 -->
											<a href="#link-to-user" class="am-comment-author">s***9（匿名）</a>
											<!-- 评论者 -->
											评论于
											<time datetime="">2017年11月26日 15:09</time>
										</div>
									</header>

									<div class="am-comment-bd">
										<div class="tb-rev-item " data-id="255776406962">
											<div class="J_TbcRate_ReviewContent tb-tbcr-content ">游戏挺多的，运行很流畅，全家人都很喜欢玩，卖家服务周到，到货速度很快，以后会再来光顾的！</div>
											<div class="tb-r-act-bar">套餐：套餐一  颜色分类：黑色NEW3DSLL</div>
										</div>

									</div>
									<!-- 评论内容 -->
								</div>
							</li>
							

						</ul>
					</div>
				</div>
			</div>
			<!--底部-->
			<%@ include file="foot.jsp"%>
		</div>
	</div>
</body>
</html>