<%@ page contentType="text/html; charset=UTF-8" %>


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
                    <input class="button btn btn-default" type="submit" value="Gửi" />
                </div>
            </div>
        </div>

    </fieldset>

</form>