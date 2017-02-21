<!DOCTYPE html>
<html>

  {include file='layouts/header.tpl'}

  <body class="hold-transition skin-blue sidebar-mini">
    <div class="wrapper">

      {include file='layouts/header_body.tpl'}
      <!-- Left side column. contains the logo and sidebar -->
      {include file='layouts/slibar.tpl'}

      <!-- Content Wrapper. Contains page content -->
      <div class="content-wrapper"> 
        <!-- /.content-wrapper -->
        <!-- Main content -->
        <section class="content">
          {block name="main-content"}{/block}
        </section><!-- /.content -->
      </div>

      <!-- Control Sidebar -->  
      {include file='layouts/control_slibar.tpl'}

      {include file='layouts/footer.tpl'}
      <!-- ./wrapper -->
      </div>
    {include file='layouts/script.tpl'}
  </body>
</html>
