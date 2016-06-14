<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ taglib prefix="security" uri="http://www.springframework.org/security/tags" %>

<!-- Navigation -->
<nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
    <div class="navbar-header">
        <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="${pageContext.request.contextPath}/admin/home">Admin Sportshop</a>
    </div>
    <!-- /.navbar-header -->

    <ul class="nav navbar-top-links navbar-right">
       
        <li class="dropdown">
            <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                <i class="fa fa-user fa-fw"></i>  <i class="fa fa-caret-down"></i>
            </a>
            <ul class="dropdown-menu dropdown-user">
                <li><a href="#"><i class="fa fa-user fa-fw"></i> Xin chào,<security:authorize access="isAuthenticated()">
					<security:authentication property="principal.username" /> 
				</security:authorize> </a>
                
                </li>
                <li class="divider"></li>
                <li><a href="${pageContext.request.contextPath}/logout"><i class="fa fa-sign-out fa-fw"></i> Đăng xuất</a>
                </li>
            </ul>
            <!-- /.dropdown-user -->
        </li>
        <!-- /.dropdown -->
    </ul>
    <!-- /.navbar-top-links -->

    <div class="navbar-default sidebar" role="navigation">
        <div class="sidebar-nav navbar-collapse">
            <ul class="nav" id="side-menu">
                <!-- <li class="sidebar-search">
                    <div class="input-group custom-search-form">
                        <input type="text" class="form-control" placeholder="Tìm kiếm...">
                        <span class="input-group-btn">
                        <button class="btn btn-default" type="button">
                            <i class="fa fa-search"></i>
                        </button>
                    </span>
                    </div>
                    /input-group
                </li> -->
                <li>
                    <a href="../admin/home"><i class="fa fa-dashboard fa-fw"></i> Bảng điều khiển</a>
                </li>
                <li>
                    <a href="../admin/productlist"><i class="fa fa-book fa-fw"></i> Sản phẩm <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="../admin/productlist">Danh sách sản phẩm</a>
                        </li>
                        <li>
                            <a href="../admin/newproductpage">Thêm mới sản phẩm</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="../admin/orderlist"><i class="fa fa-book fa-fw"></i> Danh sách đơn hàng</a>
                </li>
                <li>
                    <a href="../admin/news"><i class="fa fa-book fa-fw"></i> Bài viết <span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level"`>
                        <li>
                            <a href="../admin/news">Danh sách bài viết</a>
                        </li>
                        <li>
                            <a href="../admin/addNews">Thêm mới bài viết</a>
                        </li>
                    </ul>
                </li>
                <li>
                    <a href="../admin/contact"><i class="fa fa-envelope"></i> Danh sách liên hệ</a>
                </li>
                <li>
                    <a href="../admin/user"><i class="fa fa-bar-chart-o fa-fw"></i> Người dùng<span class="fa arrow"></span></a>
                    <ul class="nav nav-second-level">
                        <li>
                            <a href="../admin/user">Danh sách người dùng</a>
                        </li>
                        <li>
                            <a href="../admin/addnewuser">Thêm người dùng</a>
                        </li>
                    </ul>
                    <!-- /.nav-second-level -->
                </li>
                <li>
                    <a href="#"><i class="fa fa-glass"></i> Cấu hình</a>
                </li>
                <li>
                    <a href="../logout"><i class="fa fa-user"></i> Đăng xuất</a>
                </li>
            </ul>
        </div>
        <!-- /.sidebar-collapse -->
    </div>
    <!-- /.navbar-static-side -->
</nav>