<%@ page contentType="text/html; charset=UTF-8" %>


<script type="text/javascript" src="https://www.google.com/recaptcha/api.js"></script>
<script src="http://maps.googleapis.com/maps/api/js"></script>
<script>
    function initialize() {
      var mapProp = {
        center:new google.maps.LatLng(51.508742,-0.120850),
        zoom:5,
        mapTypeId:google.maps.MapTypeId.ROADMAP
      };
      var map=new google.maps.Map(document.getElementById("googleMap"),mapProp);
    }
    google.maps.event.addDomListener(window, 'load', initialize);
</script>



<div class="container">

    <!-- Breadcrumb -->
    <%@ include file="../breadcrumb/breadcrumb.jsp" %>
    
    
    <div class="row">
        <section id="sidebar-main" class="col-md-12">
            <div id="content">
                <div class="wrapper no-margin">
                    <div class="row contact-content">
                        <div class="col-ld-4 col-md-4 col-sm-12 hidden-xs">
                            <%@ include file= "contact-info.jsp" %>
                        </div>
                        <!-- end1 -->
                        <div class="col-ld-8 col-md-8 col-sm-12">
                            <%@ include file= "contact-form.jsp" %>
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
</div>