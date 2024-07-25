use lib '.';
require "util.pl";
use JavaScript;


my $arr = Array->new(7,8,9);
$arr->push(5,6,7);
my @arrValues = $arr->values();
my @arrKeys = $arr->keys();
println('values');
foreach my $v (@arrValues) {
  println($v);
}
println('keys');
foreach my $k (@arrKeys) {
  println($k);
}

println($arr->pop());
println($arr->get(3));
$arr->set(3,"cheese");
println($arr->get(3));
foreach my $v (@{$arr->values()}) {
  print($v,"-2\n");
}

$testArr = $arr->map(sub{return @_[0]*3});
println($testArr->join(","));

$testArr->push(7,7,7,7);
println("testArr has 7?",$testArr->includes(7));
println($testArr->indexOf(7));
println($testArr->lastIndexOf(7));
println($testArr->indexOf(37));
println($testArr->join(','));
println($testArr->uniq()->join(','));
println($testArr->reduce(sub{return ($_[0]+$_[1]);}));
println($testArr->concat($arr)->join(","));

$testSet=Set->new();

$testSet->add(7);
println($testSet);

1;