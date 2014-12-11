package Station::Web::Dispatcher;
use strict;
use warnings;
use utf8;
use Amon2::Web::Dispatcher::RouterBoom;

use Module::Find;

useall 'Station::Web::C';
base 'Station::Web::C';

get '/' => "Station#home";

get '/line' => "Station#line";

get '/station' => "Station#station";

get '/stationcd' => "Station#stationcd";

get '/stationg' => "Station#stationg";

get '/near' => "Station#near";

post '/result' => "Station#post";

post '/post/line' => "Station#postline";

post '/post/station' => "Station#poststation";

post '/post/stationcd' => "Station#poststationcd";

post '/post/stationg' => "Station#poststationg";

post '/post/near' => "Station#postnear";



1;
