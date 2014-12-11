use strict;
use warnings;
use Test::More;


use Station;
use Station::Web;
use Station::Web::View;
use Station::Web::ViewFunctions;

use Station::DB::Schema;
use Station::Web::Dispatcher;


pass "All modules can load.";

done_testing;
