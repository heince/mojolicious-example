use Mojolicious::Lite;

get '/' => {template => 'target'};

post '/' => sub {
  my $c = shift;

  # Check CSRF token
  my $v = $c->validation;
  return $c->render(text => 'Bad CSRF token!', status => 403)
    if $v->csrf_protect->has_error('csrf_token');

  my $city = $v->required('city')->param('city');
  $c->render(text => "Low orbit ion cannon pointed at $city!")
    unless $v->has_error;
} => 'target';

app->start;
__DATA__

@@ target.html.ep
<!DOCTYPE html>
<html>
  <body>
    %= form_for target => begin
      %= csrf_field
      %= label_for city => 'Which city to point low orbit ion cannon at?'
      %= text_field 'city', id => 'city'
      %= submit_button
    %= end
  </body>
</html>
