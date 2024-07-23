
package Set;
require "util.pm";

sub new {
    my $class = shift;
    my $self = {
        _set => {}
    };
    bless $self, $class;
    return $self;
}
sub constructor {
    return new(@_);
}
sub type {
  return "Set";
}

#set
#get
sub size {
    my ($self) = shift(@_);
    return ~~@{keys(%{$self->{_set}})};
}

sub add {
    my ($self) = shift(@_);
    my @ar = @_;
    foreach my $v (@ar){
      $self->{_set}{$v} = 1
    }
    return $self;
}
sub concat {
    my ($self) = shift(@_);
    my $arr = shift(@_);
    $self->add(@{$arr->values()}); 
    return $self;
}
#Set.prototype.clear()
sub delete {
    my ($self) = shift(@_);
    my $key = shift(@_);
    delete(%{$self->{_set}}{$key});
}
#Set.prototype.difference()
#Set.prototype.entries()
sub forEach {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{keys(%{$self->{_set}})};
 my $i=0;
 foreach my $v (@arrValues) {
   &{$lambda}($v,$i,@arrValues);
   $i++;
 }
}
sub filter {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{keys(%{$self->{_set}})};
 my $filtered = Set->new();
 my $i=0;
 foreach my $v (@arrValues) {
  if(&{$lambda}($v,$i,@arrValues)){
     $filtered->add($v);
   }
   $i++;
 }
 return $filtered;
}
#Set.prototype.has()
sub includes {
 my ($self) = shift(@_);
 my $test = shift(@_);
 my @arrValues = @{keys(%{$self->{_set}})};
 foreach my $v (@arrValues) {
   if($v == $test){
     return $true;
   }
 }
 return $false;
}
#Set.prototype.intersection()
#Set.prototype.isDisjointFrom()
#Set.prototype.isSubsetOf()
#Set.prototype.isSupersetOf()
sub join{
    my ($self) = shift(@_);
    my $joiner = shift(@_);
    return join($joiner,@{keys(%{$self->{_set}})});
}
#Set.prototype.keys()
sub map {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{keys(%{$self->{_set}})};
 my $mapped = Set->new();
 my $i=0;
 foreach my $v (@arrValues) {
   $mapped->add(&{$lambda}($v,$i,@arrValues));
   $i++;
 }
 return $mapped;
}
sub reduce {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{keys(%{$self->{_set}})};
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
#Set.prototype.symmetricDifference()
#Set.prototype.union()
sub values {
    my ($self) = @_;
    return @{keys(%{$self->{_set}})};
}

1;


