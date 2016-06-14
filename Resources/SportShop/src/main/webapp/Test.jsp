<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>File Upload Demo</title>

<script type="text/javascript" src="../SportShop/catalog/view/javascript/jquery/jquery-2.1.1.min.js"></script>

<script type="text/javascript">
function saveUploadImage() {
	var files = document.getElementById('fileUpload').value;
	
	$.ajax({
		  type: "POST",
		  url: "../SportShop/admin/doAddbaiviet",
		  data: {file:files},
			contentType : false,
		    success     : function(r) {
		    	alert("success");

		    },

		    error       : function(r) { alert("failed"); }
		  
		});
	
	/* $.post("../SportShop/admin/doAddbaiviet", {
				file : files
			}, contentType : 'multipart/form-data',
		    mimeType    : 'multipart/form-data',)
			.done(function(data) {
				alert("success");
			})
			.fail(
					function() {
						alert("failed");
					}); */
};
</script>
</head>
<body>
    <center>
       <!-- <form method="POST" action="admin/uploadImage" enctype="multipart/form-data"> -->
		File to upload: <input type="file" name="file" id="fileUpload">
 
		Name: <input type="text" name="name">
 
 
		<input type="button" value="Upload" onclick="saveUploadImage()"> Press here to upload the file!
	<!-- </form>	 -->
    </center>
</body>
</html>