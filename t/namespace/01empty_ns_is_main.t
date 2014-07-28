package main;

use strict;
use warnings;

use Inline CPP => Config => namespace => '';

use Inline CPP => <<'EOCPP';

class Foo {
  private:
    int a;
  public:
    Foo() :a(10) {}
    int fetch () { return a; }
};
EOCPP

use Inline CPP => <<'EOCPP';

class Bar {
  private:
    int a;
  public:
    Bar() :a(20) {}
    int fetch () { return a; }
};
EOCPP

package main;
use Test::More;

can_ok 'Foo', 'new';
can_ok 'main::Foo', 'new';
can_ok 'Foo', 'fetch';
can_ok 'main::Foo', 'fetch';
my $f = new_ok 'Foo';
is ref($f), 'main::Foo', 'Our "Foo" is a "main::Foo"';

can_ok 'Bar', 'new';
my $fb = Bar->new;
is ref($fb), 'main::Bar', 'Our "Bar" is a "main::Bar"';

is $f->fetch, 10, 'Proper object method association from Foo.';
is $fb->fetch, 20, 'Proper object method association from Bar.';

done_testing();
