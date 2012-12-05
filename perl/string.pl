#!/usr/bin/perl
###############################################
#
#用于对比两个本地化的string文件的脚本
#
# 2012-12-5
###############################################

use strict;
use warnings;
my $firstName =  $ARGV[0] || "Agenda.string";
my $secondName = $ARGV[1] || "Agenda.string";
open my $file,"<",$secondName or die "Fail to open $secondName $!";
my %string;
while(<$file>)
{
    next if !/=/;
    my ($key,$value)=split/=/;
    $key =~ s/\s+//g;
    $value =~ s/\s+//g;
    $string{$key} = $value;
}

open my $firstFile,"<",$firstName or die "Fail to open $firstName $!";
my @keys;
while(<$firstFile>)
{
    if( !/=/)
    {
        print ;
    }
    my($key,$value)=split/=/;
    $key =~ s/\s+//g;
    my $tempValue;
    $tempValue = $string{$key};
    if (defined  $tempValue)
    {
        print "$key = $tempValue \n";
    }
}



