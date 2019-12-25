use Mojolicious::Lite -signatures;

get '/' => sub($c) {
	$c->stash( mydata => q|[
					[ "heince", "male" ],
					[ "asia2", "male" ]
				]|);
	$c->render(template => 'index');
};
app->start;

__DATA__
@@index.html.ep
<link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.10.20/css/jquery.dataTables.min.css"/>
<script src="https://code.jquery.com/jquery-3.3.1.js" type="text/javascript"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js" type="text/javascript"></script>

<script>
	var mydata = <%== $mydata %>;

	$(document).ready(function() {
			$('#example').DataTable( {
				data: mydata,
				columns: [
					{ title: "Name" },
					{ title: "Sex" }
				]
			} );
	} );
</script>
<table id="example" class="display" width="100%"></table>
