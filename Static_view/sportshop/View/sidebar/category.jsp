<%@ page contentType="text/html; charset=UTF-8" %>

<div class="category box box-success">
    <div class="box-heading"><span>Chuyên mục</span></div>
    <div class="box-content tree-menu">
        <ul class="box-category list-group accordion">
            <li class="list-group-item accordion-group">
                <a href="category.html">Áo bóng đá</a>
            </li>
            <li class="list-group-item accordion-group">
                <a href="category.html">Áo câu lạc bộ</a>
            </li>
            <li class="list-group-item accordion-group">
                <a href="category.html">Áo đội tuyển</a>
            </li>
            <li class="list-group-item accordion-group">
                <a href="category.html">Mới</a>
            </li>
            <li class="list-group-item accordion-group">
                <a href="category.html">Giày đá bóng</a>
            </li>
            <li class="list-group-item accordion-group">
                <a href="category.html">Giày quần vợt</a>
            </li>
            <li class="list-group-item accordion-group">
                <a href="category.html">Giày Nike </a>
            </li>
            <li class="list-group-item accordion-group">
                <a href="category.html">Giày Tom</a>
            </li>
            <li class="list-group-item accordion-group">
                <a href="category.html">Dụng cụ thể thao</a>
            </li>
        </ul>
    </div>
</div>
<script type="text/javascript">
$(document).ready(function() {
    var active = $('.collapse.in').attr('id');
    $('span[data-target=#' + active + ']').html("-");

    $('.collapse').on('show.bs.collapse', function() {
        $('span[data-target=#' + $(this).attr('id') + ']').html("-");
    });
    $('.collapse').on('hide.bs.collapse', function() {
        $('span[data-target=#' + $(this).attr('id') + ']').html("+");
    });
});
</script>