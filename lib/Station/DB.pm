package Station::DB;
use strict;
use warnings;
use utf8;
use parent qw(Teng);

__PACKAGE__->load_plugin('Count');
__PACKAGE__->load_plugin('Replace');
__PACKAGE__->load_plugin('Pager');

sub insert_pref{
 my($self,$pref_id) = @_;
 $self->insert('pref',{pref_id => $pref_id});
}

sub insert_line{
 my($self,$line_cd) = @_;
 $self->insert('line',{linecd => $line_cd});
}

sub insert_stationcd{
 my($self,$stationcd) = @_;
 $self->insert('stationcd',{stationcd => $stationcd});
}

sub insert_near{
 my($self,$linecd) = @_;
 $self->insert('line',{linecd => $linecd});
}

sub insert_stationg{
 my($self,$stationg) = @_;
 $self->insert('stationg',{stationgcode => $stationg});
}

sub latest_prefid{
  my ($self) = @_;
  my ($row) = $self->search(
        'pref',
        {},
        { order_by => {'id' => 'DESC'}, limit => 1 }
  );
  return $row->get_column('pref_id') if ($row);
}

sub latest_linecd{
 my ($self) = @_;
 my ($row) = $self->search(
        'line',
        {},
        { order_by => {'id' => 'DESC'}, limit => 1 }
 );
 return $row->get_column('linecd') if ($row);
}

sub latest_stationcode{
 my ($self) = @_;
 my ($row) = $self->search(
        'stationcd',
        {},
        { order_by => {'id' => 'DESC'}, limit => 1 }
 );
 return $row->get_column('stationcd') if ($row);
}

sub latest_stationg{
 my ($self) = @_;
 my ($row) = $self->search(
        'stationg',
        {},
        { order_by => {'id' => 'DESC'}, limit => 1 }
 );
 return $row->get_column('stationgcode') if ($row);
}

sub latest_nearcd{
 my ($self) = @_;
 my ($row) = $self->search(
    'line',
			   {},
			   {order_by =>{'id' => 'DESC'},limit => 1}
);
 return $row->get_column('linecd') if ($row);
}


1;
