<%@ page contentType="text/html; charset=UTF-8" %>


<div class="container">

   <!-- Breadcrumb -->
   <%@ include file="../breadcrumb/breadcrumb.jsp" %>
   
   <div class="row">
       
       <aside id="sidebar-left" class="col-md-3">
			<div id="column-left" class="hidden-xs sidebar">
				<!-- Category -->
				<%@ include file = "../sidebar/category.jsp" %>
				
				
				<!-- Lastest Product -->
				<%@ include file= "../sidebar/lastest-product.jsp" %>
				
				
				<!-- Banner -->
				<%@ include file = "../sidebar/banner.jsp" %>
				
				
			</div>
		</aside>


       <section id="sidebar-main" class="col-md-9">

           <div class="product-filter clearfix">
               <div class="inner clearfix">
                   <div class="display">
                       <div class="btn-group group-switch">
                           <button type="button" id="list-view" class="btn btn-switch" data-toggle="tooltip" title="Danh sách"></button>
                           <button type="button" id="grid-view" class="btn btn-switch active" data-toggle="tooltip" title="Lưới"></button>
                       </div>
                   </div>
                   <div class="filter-right">
                       <div class="sort pull-right">
                           <span for="input-sort">Sắp xếp:</span>
                           <select id="input-sort" class="form-control" onchange="location = this.value;">
                               <option value="" selected="selected">Mặc định</option>
                               <option value="">Tên (A - Z)</option>
                               <option value="">Tên (Z - A)</option>
                               <option value="">Giá (Thấp &gt; Cao)</option>
                               <option value="">Giá (Cao &gt; Thấp)</option>
                               <option value="">Đánh giá (Cao nhất)</option>
                               <option value="">Đánh giá (Thấp nhất)</option>
                               <option value="">Mẫu (A - Z)</option>
                               <option value="">Mẫu (Z - A)</option>
                           </select>
                       </div>

                       <div class="limit pull-right">
                           <span for="input-limit">Hiển thị:</span>
                           <select id="input-limit" class="form-control" onchange="location = this.value;">
                               <option value="" selected="selected">15</option>
                               <option value="">25</option>
                               <option value="">50</option>
                               <option value="">75</option>
                               <option value="">100</option>
                           </select>
                       </div>
                   </div>
               </div>
           </div>

           <div id="products" class="product-grid">
               <div class="products-block">
                   <div class="row products-row">
                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>

                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>

                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>
                   </div>

                   <div class="row products-row">
                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>

                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>

                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>
                   </div>

                   <div class="row products-row">
                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>

                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>

                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>
                   </div>

                   <div class="row products-row">
                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>

                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                       </div>

                       <div class="col-lg-4 col-md-4 col-sm-4 col-xs-12 product-col">
                           <%@ include file="product.jsp" %>
                        </div>
                    </div>
                </div>
            </div>
            <div class="paging clearfix">
                <div class="pull-left">
                    <%@ include file="../pagination/pagination.jsp" %>
                </div>
                
                <div class="pull-right">Đang hiển thị 1 - 12 sản phẩm (1 trang)</div>
            </div>
        </section>
    </div>
</div>