{extends file='layouts/master_layout.tpl'} 
{block name="main-content"}
	<div class="box box-info" id="main-box" name="main-box">
		<div class="panel panel-success col-md-7">
            <div class="panel-heading">
                <h2 class="panel-title">Thêm Mới Người Dùng </h2>
            </div>
            <div class="panel-body">
                <form action="" method="post" enctype="multipart/form-data">
                    <div class="form-group">
                        <label>Email: </label>
                        <input type="email" required name="user_email" value="" class="form-control">
                    </div>
                    <div class="form-group">
                        <label>Mật Khẩu: </label>
                        <input type="password" required name="user_pass" value="" class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Tên: </label>
                        <input type="text" required name="user_firstname" value="" class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Họ: </label>
                        <input type="text" required name="user_lastname" value="" class="form-control">
                    </div>

                    <div class="form-group">
                        <label>Số Điện Thoại: </label>
                        <input type="text" required name="user_phone" value="" class="form-control">
                    </div>

                    <label>Quyền Truy Cập: </label>
                    <div class="form-group">
                        <select name="user_type" id="">
                            <option value="admin">Administrator</option>
                            <option value="user">User</option>
                        </select>
                    </div>

                        <label>Phân Quyền: </label>
                        <div class="form-group">

                            <select name="user_role"  id="" >
                            	{foreach from=$roles key=k item=v}
								    <option value="{$v['role_id']}" >{$v['role_name']}</option>
								{/foreach}
                            </select>
                        </div>
                    <div class="form-group">
                        <label>Chọn Ảnh: </label>
                        <input type="file"  name="user_image">
                    </div>

                       
                        <div class="form-group">
                            <input  type="submit" name="btn_add_user" value="Thêm Mới" class="btn btn-lg btn-success" />
                        </div>
                        {if $success_notice}
                            <script type="text/javascript">alert("Thêm Mới Thành Công");</script>
                        {/if}
                </form>
            </div>
         </div>
        <div class="col-md-3">
            <img src="{php} echo base_url();{/php}img/hientq_avatar.PNG" alt="image" class="img-responsive img-rounded" >
        </div>
    </div>
{/block}