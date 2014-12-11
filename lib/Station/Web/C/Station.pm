package Station::Web::C::Station;

use Data::Dumper;
use Station::Model::Station;

my $station = new Station::Model::Station();

sub home{
 my($class,$c)= @_;
 my $latest_prefid = $c->db->latest_prefid;
 my $line = $station->pref({prefcode => $latest_prefid});
 my $lines = $line->{line}; 
 return $c->render('index.tx',{lines => $lines});
}

sub line{
 my($class,$c) = @_;
 my $latest_linecd = $c->db->latest_linecd;
 my $stations = $station->line({linecode => $latest_linecd});
 my $line_name = $stations->{line_name};
 my $station_l = $stations->{station_l};
 return $c->render('line.tx',{line_name => $line_name,stations => $station_l});
}

sub poststationcd{
 my($class,$c) = @_;
 if(my $stationcd = $c->req->param('stationcd')){
   $c->db->insert_stationcd($stationcd);  
 }
 return $c->redirect('/stationcd');
}

sub post{
 my($class,$c) = @_;
 my $param =  $c->req->parameters;
 my $pref_id = $param->{pref_id};
 $c->db->insert_pref($pref_id);
 return $c->redirect('/');
}

sub postline{
 my($class,$c) = @_;
 my $param = $c->req->parameters;
 my $line_cd = $param->{linecd};
 $c->db->insert_line($line_cd);
 return $c->redirect('/line');
}

sub poststaioncd{
 my($class,$c) = @_;
 if(my $station_cd = $c->req->param('stationcd')){
  $c->db->insert_stationcd($station_cd);
 }
 return $c->redirect('/stationcd');
}

sub stationcd{
 my($class,$c) = @_;
 my $stationcode = $c->db->latest_stationcode;
 my $station_info = $station->station({stationcode => $stationcode});
 my $station_infos =  $station_info->{station};
 return  $c->render('stationcd.tx',{stationinfo => $station_infos});
}

sub stationg{
 my($class,$c) = @_;
 my $stationg = $c->db->latest_stationg;
 my $stationg_info = $station->group({stationcode => $stationg});
 return $c->render('stationg.tx',{stationinfoso => $stationg_info->{station_g}});
}

sub poststationg{
 my($class,$c) = @_;
 if(my $station_g = $c->req->param('stationg')){
   $c->db->insert_stationg($station_g);
 }
 return $c->redirect('/stationg');
}

sub postnear{
 my($class,$c) = @_;
 if(my $linecd = $c->req->param('linecd')){
   $c->db->insert_near($linecd);
 }
 return $c->redirect('/near');
}

sub near{
 my($class,$c) = @_;
 my $linecd = $c->db->latest_linecd;
 my $stationinfo = $station->near({linecode => $linecd});
 print Dumper $stationinfo;
 return $c->render('near.tx',{stationjoin => $stationinfo->{station_join}});
}

1;
