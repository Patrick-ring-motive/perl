sub println{
  print(join(", ",@_),"\n");
} 
$false;
$true = !$false;
sub fetch{
  my $url = shift(@_);
  return `curl $url`;
}
1;