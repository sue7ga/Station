package Station::DB::Schema;
use strict;
use warnings;
use utf8;

use Teng::Schema::Declare;

base_row_class 'Station::DB::Row';

table {
    name 'pref';
    pk 'id';
    columns qw(id pref_id);
};

table {
    name 'line';
    pk 'id';
    columns qw(id linecd);
};

table {
  name 'stationcd';
  pk 'id';
  columns qw(id stationcd);
};

table{
 name 'stationg';
 pk 'id';
 columns qw(id stationgcode);
};

table{
 name 'line';
 pk 'id';
 columns qw(id linecd);
};

1;
