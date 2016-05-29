<%@ page contentType="text/html; charset=UTF-8" %>


<div class="pav-comment">
    <h4>Để lại bình luận</h4>
    <form action="#" method="post" id="comment-form" class="form-horizontal">
        <fieldset>
            <div class="message" style="display:none"></div>
            <div class="form-group required">
                <label class="col-sm-2 control-label" for="comment-user">Tên của bạn</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" name="comment[user]" value="" id="comment-user" />
                </div>
            </div>

            <div class="form-group required">
                <label class="col-sm-2 control-label" for="comment-email">Email</label>
                <div class="col-sm-8">
                    <input class="form-control" type="text" name="comment[email]" value="" id="comment-email" />
                </div>
            </div>

            <div class="form-group required">
                <label class="col-sm-2 control-label" for="comment-comment">Nội dung</label>
                <div class="col-sm-8">
                    <textarea class="form-control" name="comment[comment]" id="comment-comment"></textarea>
                </div>
            </div>

            <input type="hidden" name="comment[blog_id]" value="9" />
            <br/>
            <div class="buttons-wrap">
                <button class="btn btn-submit btn-default" type="submit">
                    <span>Đăng bình luận</span>
                </button>
            </div>
        </fieldset>
    </form>
</div>