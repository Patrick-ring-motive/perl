
package JavaScript;

1;

package console;

sub log{
  shift(@_);
  print(join(", ",@_),"\n");
}

1;
 

 package Array;

sub new {
    my $class = shift;
    my $self = {
        _arr => [@_]
    };
    bless $self, $class;
    return $self;
}
sub constructor {
    return new(@_);
}
sub type {
  return "Array";
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


sub at {
    return get(@_);
}
sub concat {
    my ($self) = shift(@_);
    my $arr = shift(@_);
    push(@{$self->{_arr}}, @{$arr->values()}); 
    return $self;
}
sub copyWithin {
    my ($self) = shift(@_);
    my $target = shift(@_);
    my $start = shift(@_);
    my $end = shift(@_);
    if(not $end){
        $end = $self->length + 1;
    }
    my $index = 0;
    my $targetIndex = $target;
    my @arrValues = @{$self->{_arr}};
    foreach my $v (@arrValues) {
       if($index >= $start && $index < $end){
           $self->set($targetIndex,$v);
           $targetIndex++;
       }
       $index++;
     }
     return $self
}
sub entries {
 my ($self) = shift(@_);
 my @arrValues = @{$self->{_arr}};
 my $entries = Array->new();
 my $i=0;
 foreach my $v (@arrValues) {
   $entries->push(Array->new($i,$v));
   $i++;
 }
 return $entries;
}
sub every {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{$self->{_arr}};
 foreach my $v (@arrValues) {
  if(not(&{$lambda}($v,$i,@arrValues))){
     return 0;
   }
 }
 return 1;
}
sub fill {
    my ($self) = shift(@_);
    my $fill = shift(@_);
    my $start = shift(@_);
    if(not $start){
        $start = 0;
    }
    my $end = shift(@_);
    if(not $end){
        $end = $self->length + 1;
    }
    my $index = 0;
    my @arrValues = @{$self->{_arr}};
    foreach my $v (@arrValues) {
       if($index >= $start && $index < $end){
           $self->set($index,$fill);
       }
       $index++;
     }
     return $self
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
sub find {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{$self->{_arr}};
 foreach my $v (@arrValues) {
  if(&{$lambda}($v,$i,@arrValues)){
     return $v;
   }
 }
}
sub findIndex {
 my ($self) = shift(@_);
 my $lambda = shift(@_);
 my @arrValues = @{$self->{_arr}};
 my $i = 0;
 foreach my $v (@arrValues) {
  if(&{$lambda}($v,$i,@arrValues)){
     return $i;
   }
   $i++;
 }
}
sub findLast {
    my ($self) = shift(@_);
    return $self->reverse()->find(@_);
}
sub findLastIndex {
    my ($self) = shift(@_);
    return $self->reverse()->findIndex(@_);
}
#Array.prototype.flat()
sub flat {
 my ($self) = shift(@_);
 my $depth = shift(@_);
 my $flat = Array->new();
 my @arrValues = @{$self->{_arr}};
 foreach my $v (@arrValues) {
   if(ref($v) == 'ARRAY'){
     my @arr = @{$v};
     foreach my $x (@arr) {
       $flat->push($x);
     }
     next;
   }
    if($v->type == 'Array'){
      my @arr = @{$v->{_arr}};
      foreach my $x (@arr) {
        $flat->push($x);
      }
      next;
    }
    $flat->push($v);
 }
 if($depth > 1){
   return $flat->flat($depth-1);
 }
 return $flat;
}
sub flatMap {
    return map(@_)->flat();
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
sub join{
    my ($self) = shift(@_);
    my $joiner = shift(@_);
    return join($joiner,@{$self->{_arr}});
}
sub keys {
   my ($self) = shift(@_);
   my @arrValues = @{$self->{_arr}};
   my $keys = Array->new();
   my $i=0;
   foreach my $v (@arrValues) {
     $keys->push($i);
     $i++;
   }
   return $keys->values();
}
sub lastIndexOf {
 my ($self) = shift(@_);
 my $test = shift(@_);
 return $self->length-$self->reverse()->indexOf($test);
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
sub push {
    my ($self) = shift(@_);
    push(@{$self->{_arr}}, @_); 
}
sub pop {
    my ($self) = shift(@_);
    return pop(@{$self->{_arr}});
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
#Array.prototype.reduceRight()
sub reverse {
 my ($self) = shift(@_);
 my @arrValues = @{$self->{_arr}};
 my $reversed = Array->new();
 foreach my $v (@arrValues) {
   $reversed->unshift($v);
 }
 return $reversed;
}
sub shift {
    my ($self) = shift(@_);
    return shift(@{$self->{_arr}});
}
sub unshift {
    my ($self) = shift(@_);
    unshift(@{$self->{_arr}}, @_);
    return $self;
}
#Array.prototype.slice()
#Array.prototype.some()
#Array.prototype.sort()
#Array.prototype.splice()
#Array.prototype[Symbol.iterator]()
#Array.prototype.toLocaleString()
#Array.prototype.toReversed()
#Array.prototype.toSorted()
#Array.prototype.toSpliced()
#Array.prototype.toString()
sub uniq {
  my ($self) = shift(@_);
  my %set;
  my @arrValues = @{$self->{_arr}};
  foreach my $v (@arrValues){
    $set{$v} = 1;
  }
  return Array->new(keys(%set))
}
sub values {
    my ($self) = @_;
    return @{$self->{_arr}};
}
#Array.prototype.with()
1;

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


