<%@ page contentType="text/html; charset=UTF-8" %>


<div class="box products-related">
    <div class="tab-nav">
        <ul class="nav nav-pills">
            <li class="active"><a data-toggle="tab">Sản phẩm liên quan (6)</a></li>
        </ul>
    </div>
    <div id="product-related" class="slide" data-interval="0">
        <div class="carousel-controls">
            <a class="carousel-control left" href="#product-related" data-slide="prev">
                <i class="fa fa-angle-left"></i>
            </a>
            <a class="carousel-control right" href="#product-related" data-slide="next">
                <i class="fa fa-angle-right"></i>
            </a>
        </div>
        <div class="products-block carousel-inner">
            <div class="item active">
                <div class="row products-row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 product-col">
                        <%@ include file= "product.jsp" %>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 product-col">
                        <%@ include file="product.jsp" %>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 product-col">
                        <%@ include file="product.jsp" %>
                    </div>
                </div>
            </div>
            <div class="item">
                <div class="row products-row">
                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 product-col">
                        <%@ include file="product.jsp" %>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 product-col">
                        <%@ include file="product.jsp" %>
                    </div>

                    <div class="col-lg-4 col-md-4 col-sm-6 col-xs-12 product-col">
                        <%@ include file="product.jsp" %>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>