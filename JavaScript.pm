
package JavaScript;

1;

package Array;
require "util.pm";

sub new {
    my $class = shift;
    my $self = {
        _arr => [@_]
    };
    bless $self, $class;
    return $self;
}
sub set {
    my ($self) = shift(@_);
    my $key = shift(@_);
    my $val = shift(@_);
    @{$self->{_arr}}[$key] = $val;
}
sub get {
    my ($self) = shift(@_);
    my $key = shift(@_);
    return @{$self->{_arr}}[$key];
}
sub length {
    my ($self) = shift(@_);
    return ~~@{$self->{_arr}};
}
sub values {
    my ($self) = @_;
    return $self->{_arr};
}
sub push {
    my ($self) = shift(@_);
    push(@{$self->{_arr}}, @_); 
}
sub pop {
    my ($self) = shift(@_);
    return pop(@{$self->{_arr}});
}
sub unshift {
    my ($self) = shift(@_);
    unshift(@{$self->{_arr}}, @_);
    return $self;
}
sub shift {
    my ($self) = shift(@_);
    return shift(@{$self->{_arr}});
}
sub join{
    my ($self) = shift(@_);
    my $joiner = shift(@_);
    return join($joiner,@{$self->{_arr}});
}
sub map {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{$self->{_arr}};
 my $mapped = Array->new();
 my $i=0;
 foreach my $v (@arrValues) {
   $mapped->push(&{$lambda}($v,$i,@arrValues));
   $i++;
 }
 return $mapped;
}
sub reverse {
 my ($self) = shift(@_);
 my @arrValues = @{$self->{_arr}};
 my $reversed = Array->new();
 foreach my $v (@arrValues) {
   $reversed->unshift($v);
 }
 return $reversed;
}
sub forEach {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{$self->{_arr}};
 my $i=0;
 foreach my $v (@arrValues) {
   &{$lambda}($v,$i,@arrValues);
   $i++;
 }
}
sub filter {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{$self->{_arr}};
 my $filtered = Array->new();
 my $i=0;
 foreach my $v (@arrValues) {
  if(&{$lambda}($v,$i,@arrValues)){
     $filtered->push($v);
   }
   $i++;
 }
 return $filtered;
}
sub reduce {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{$self->{_arr}};
 my $i=0;
 my $x=@arrValues[0];
 if(~~@_>0){
  $x=shift(@_);
 }
 foreach my $y (@arrValues) {
   $x=(&{$lambda}($x,$y,$i,@arrValues));
   $i++;
 }
 return $x;
}
sub includes {
 my ($self) = shift(@_);
 my $test = shift(@_);
 my @arrValues = @{$self->{_arr}};
 foreach my $v (@arrValues) {
   if($v == $test){
     return $true;
   }
 }
 return $false;
}
sub indexOf {
 my ($self) = shift(@_);
 my $test = shift(@_);
 my @arrValues = @{$self->{_arr}};
 my $i=0;
 foreach my $v (@arrValues) {
   if($v == $test){
     return $i
   }
   $i++;
 }
 return -1;
}
sub lastIndexOf {
 my ($self) = shift(@_);
 my $test = shift(@_);
 return $self->length-$self->reverse()->indexOf($test);
}
sub uniq {
  my ($self) = shift(@_);
  my %set;
  my @arrValues = @{$self->{_arr}};
  foreach my $v (@arrValues){
    $set{$v} = 1;
  }
  return Array->new(keys(%set))
}

1;

package console;

sub log{
  shift(@_);
  print(join(", ",@_),"\n");
}

1;
 

 