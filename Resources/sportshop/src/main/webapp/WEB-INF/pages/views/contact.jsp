<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Liên Hệ | Sportshop</title>
<%@ include file="../views/templates/head.jsp"%>

 <script type="text/javascript" src="https://www.google.com/recaptcha/api.js"></script>
    <script src="http://maps.googleapis.com/maps/api/js"></script>
    <script>
    	function postRequestToAdmin(){
    		var fname = document.getElementById("input-name").value;
    		var femail = document.getElementById("input-email").value;
    		var fcontent = document.getElementById("input-enquiry").value;
    		if(fname.length < 1){
    			document.getElementById('input-name').focus();
    			alert("Họ tên đầy đủ không được để trống. Xin cám ơn!");
    			return;
    		}
    		if(femail.length < 1){
    			document.getElementById('input-email').focus();
    			alert("Email liên hệ không được để trống. Xin cám ơn!");
    			return;
    		}
    		if(fcontent.length < 1){
    			document.getElementById('input-enquiry').focus();
    			alert("Nội dung liên hệ không được để trống. Xin cám ơn!");
    			return;
    		}
    		$.post("../view/saveContactRequest", {
    					fullName : fname,
    					email : femail,
    					content : fcontent
    				})
    				.done(function(data) {
    					alert("Thông tin liên hệ của bạn đã được gửi đến quản trị. Chúng tôi sẽ liên lạc với bạn trong thời gian sớm nhất. Xin cám ơn!");
    				})
    				.fail(
    						function() {
    							alert("Hiện tại quá trình gửi liên hệ gặp lỗi. Vui lòng thử lại. Xin cám ơn!");
				
    						});
    	};
    
        function initialize() {
          var mapProp = {
        	center:new google.maps.LatLng(10.843849, 106.639872),
            zoom:20,
            mapTypeId:google.maps.MapTypeId.ROADMAP
          };
          var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
        }
        google.maps.event.addDomListener(window, 'load', initialize);
    </script>
</head>
<body class="main-menu-fixed common-home page-common-home layout-fullwidth">
	<div class="row-offcanvas row-offcanvas-left">
		<div id="page">
			<!-- Header -->
			<%@ include file="../views/templates/header.jsp"%>
			<!-- /Header -->

			<!-- Menu -->
			<%@ include file="../views/templates/menu.jsp"%>
			<!-- /Menu -->
			
			<!-- Content: left menu & suggest product list -->
			<div class="container">
				<!-- Site map -->
				<ul class="breadcrumb">
                    <li><a href="../view/home"><i class="fa fa-home"></i></a></li>
                    <li><a href="../view/contact">Liên Hệ Với Chúng Tôi</a></li>
               	</ul>
				<!-- /Site map -->
            	
            	<!-- Content -->
            	<div class="row">
                    <section id="sidebar-main" class="col-md-12">
                        <div id="content">
                            <div class="wrapper no-margin">
                                <div class="row contact-content">
                                    <div class="col-ld-4 col-md-4 col-sm-12 hidden-xs">
                                        <div class="contact-info">
                                            <h3>Thông tin liên hệ</h3>
                                            <div class="content">
                                                <div class="media">
                                                    <i class="fa fa-map-marker pull-left"></i>
                                                    <div class="media-body">
                                                        ${ContractInformation.address }
                                                    </div>
                                                </div>
                                                <div class="media">
                                                    <i class="fa fa-phone pull-left"></i>
                                                    <div class="media-body">
                                                        <strong>${ContractInformation.phone }</strong>
                                                    </div>
                                                </div>
                                                <div class="media">
                                                    <i class="fa fa-fax pull-left"></i>
                                                    <div class="media-body">
                                                        <!-- <strong></strong> -->
                                                        ${ContractInformation.fax }
                                                    </div>
                                                </div>
                                                <div class="media">
                                                    <i class="fa fa-envelope-o pull-left"></i>
                                                    <div class="media-body">
                                                        <!-- <strong></strong> -->
                                                        ${ContractInformation.email }
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <!-- end1 -->
                                    <div class="col-ld-8 col-md-8 col-sm-12">
                                        <form action="#" method="post" enctype="multipart/form-data" class="form-horizontal ">
                                            <fieldset class="">
                                                <h3>Liên hệ</h3>
                                                <div class="content">
                                                    <div class="form-group required">
                                                        <label class="col-sm-2 control-label" for="input-name">Tên đầy đủ</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="name" value="" id="input-name" class="form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group required">
                                                        <label class="col-sm-2 control-label" for="input-email">Địa chỉ email</label>
                                                        <div class="col-sm-10">
                                                            <input type="text" name="email" value="" id="input-email" class="form-control" />
                                                        </div>
                                                    </div>
                                                    <div class="form-group required">
                                                        <label class="col-sm-2 control-label" for="input-enquiry">Nội dung</label>
                                                        <div class="col-sm-10">
                                                            <textarea name="enquiry" rows="10" id="input-enquiry" class="form-control"></textarea>
                                                        </div>
                                                    </div>
                                                    <div class="buttons">
                                                        <div class="pull-right">
                                                            <input class="button btn btn-default" type="button" value="Gửi" onclick="postRequestToAdmin()" />
                                                        </div>
                                                    </div>
                                                </div>

                                            </fieldset>

                                        </form>
                                    </div>
                                    <!-- end -->

                                    <div class="col-xs-12">
                                        <!-- Google maps -->
                                        <br><br>
                                        <div id="googleMap" style="width:100%;height:380px;"></div>
                                    </div>
                                </div>
                                <!-- end -->
                            </div>
                        </div>
                    </section>
                </div>
            
            	<!-- /Content -->
            	    
            </div>
            <!-- /Content: left menu & suggest product list -->
			
			<!-- Footer -->
			<%@ include file="../views/templates/footer.jsp"%>
			<!-- /Footer -->
			
		</div>
	</div>
</body>
</html>
