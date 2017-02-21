{extends file='layouts/master_layout.tpl'} 
{block name="main-content"}
	<div class="box box-info" id="main-box" name="main-box">
	<div class="box-header with-border">
		<h3 class="box-title"><i class="fa fa-user-secret"></i>Uset Setting</h3>
		<div class="box-tools pull-right">
        </div>
	</div>
	<div class="box-body">
		<div class="table-responsive" name="tableDiv" id="tableDiv" >
			<table class="table table-striped table-hover display dataTable" id="user-table" name ="user-table">
		         <thead>
		            <tr>
		                <th>ID</th>
		                <th>First Name</th>
		                <th>Last Name</th>
		                <th>Phone</th>
		                <th>Email</th>
		              	<th>Type</th>
		              	<th>Active</th>
		              	<th>Role</th>
		              	<th>Action</th>
		            </tr>
		        </thead>
		        <tbody>
		        <!-- {php}echo $data; {/php} -->
		        {foreach from=$user_lst item=user}
	            <tr>
	                <td>{$user['user_id']}</td>
	                <td>{$user['user_firstname']}</td>
	                <td>{$user['user_lastname']}</td>
	                <td>{$user['user_phone']}</td> 
	                <td>{$user['user_email']}</td>
	                <td>{$user['user_type']}</td>
	                <td>{$user['active']}</td>
	                <td>{$user['role_id']}</td>   
	                <td>
	                	<a href='{php} echo base_url();{/php}admin/accounts/delete/{$user['user_id']}' class="remove btn btn-xs btn-danger">
	                		<i class="fa fa-trash-o"></i>
	                	</a>
	                	<a href='#' class="edit btn btn-xs btn-primary">
	                		<i class="fa fa-edit"></i>
	                	</a>
	                </td>           
	            </tr>
	            {/foreach}
	            </tbody>
		    </table>
		</div>  
	</div>
	<div class="box-footer clearfix">
		<a href="{php}echo base_url();{/php}admin/accounts/new" id='btnCreate' name='btnCreate'
			class="btn btn-sm btn-success btn-flat pull-right">Create new User</a> 
	</div>
</div>
<script src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
<script type="text/javascript" >
	$( document ).ready(function() {
        $('#user-table').DataTable({
        	columns: [
				{ data: "user_id"    , name:'user_id'  	, className:'dt-center'},
				{ data: "user_firstname"  , name:'user_firstname'	, className:'dt-center editable' },
				{ data: "user_lastname" , name:'user_lastname'	, className:'dt-center editable' },
				{ data: "user_phone"  , name:'user_phone'	, className:'dt-center editable' },
				{ data: "user_email"  , name:'user_email'	, className:'dt-center editable' },
				{ data: "user_type", name:'user_type'	, className:'dt-center editable' },
				{ data: "active"  , name:'active'	, className:'dt-center' },
				{ data: "role_id", name:'role_id'	, className:'dt-center' }
		   ],
		   select:  true,
		   aoColumnDefs: [
		             	 { 'bSortable': false, 'aTargets': [5,6,7] }	,
		             	 { 'className': "dt-center", "aTargets": [0,1,2,3,4,5,6,7] },
		   ],
		   initComplete: function(settings, json) {
	            		$searchBox = $(".dataTables_filter input[type='search']");
	            		$searchBox.addClass('form-control input-sm');
	            		$searchBox.attr("placeholder", "Type here to search");
	            		$('.dataTables_filter label').get(0).firstChild.nodeValue = "";
	            		$('.dataTables_filter').addClass('col-sm-6');
				  	},
			dom: 'Bfrtip',
			lengthChange: false,
		    responsive: true,
        });
    });
 
</script>
{/block}