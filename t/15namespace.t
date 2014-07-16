package Foo;

use strict;
use warnings;

use Inline CPP => Config => BASE_NAMESPACE => 'main';

use Inline CPP => <<'EOCPP';





class Foo {
  private:
    int a;
  public:
    Foo() :a(10) {}
    int fetch () { return a; }
};
EOCPP


package main;
use Test::More;

can_ok 'Foo', 'new';

done_testing();
