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
open my $file,"<",$firstName or die "Fail to open $secondName $!";
my %string;
# open (FH,"< $firstName");
while(<$file>)
{
    # $_ =~ s/\r/\n/g;
    # print "hello \n";
    # print "$.";
    # print "$_ ";
    next if !/=/;
    next if /\/\//;
    my ($key,$value)=split/=/;
    $key =~ s/\s+//g;
    $value =~ s/\s+//g;
    # print "$key\n";
    $string{$key} = $value;
}
close($file);



open my $secondFile,"<",$secondName or die "Fail to open $firstName $!";
# my @keys;
# $ARGV=$secondName;
# $^I = ".bak";
while(<$secondFile>)
{
    if (!/=/)
    {
#        print ;    
        next;
    }
    if (/\/\//)
    {
#        print ;   
        next;
    }
    my($key,$value)=split/=/;
    $key =~ s/\s+//g;
    my $tempValue;
    $tempValue =  $string{$key} ;
    if (defined  $tempValue)
    {
        # $@ = "$key = $tempValue";
#       print "$key = $tempValue\n";
#       delete($string{$key});
#       #print "$key";
    }
    else
    {
        print ;
    }

}

# print "\n-----------$firstName-----------\n";
while ( my($key,$value) = each %string )
{
    print "$key = $value \n ";
}
close($secondFile);
