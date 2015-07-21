use strict;
use warnings;
#use diagnostics;

my $hash_in;
my $hash_in1;
my $output;
my %hash;
my %hash1;
my $hash;
my $hash1;
my @ar_user_lic;
my @ar_user_lic1;
my $ar_user_lic;
my $ar_user_lic1;
my $k;
my @uid;
my $item;
my $file;
##################################
my @array;
my @array1;
print "Enter the path where the User form Fixed .txt file is:\n\n";
	$file = <STDIN>;


print "Enter the path where the User list and license .txt file is:\n\n";
	$hash_in1 = <STDIN>;

print "Please enter the name and where you want the output file saved:\n\n";
	$output = <STDIN>;



open (DATA, "<$file") or die "Cannot open $!\n";
while (<DATA>){
    push (@uid,$_);}

foreach $item(@uid){$hash{$item} = 1}

#tie %hash1,"Tie::RefHash";

open (DATA,"<$hash_in1") or die "Error, file does not exist $!"; 
	while (<DATA>){ 
	chomp;
	push (@ar_user_lic1,$_); 
	@ar_user_lic1 = split(/,/); 
	$hash1{$ar_user_lic1[0]} = $ar_user_lic1[1];} 



foreach $k(keys %hash1){ 
			delete ($hash1{$k}) if exists $hash{$k};
		      }


#@array = keys %hash;
#@array1 = values %hash;
open STDOUT, "> $output" or die "Could not write to file $!\n";
print "$_ , $hash1{$_}\n" for keys %hash1;
#print "@array\n";
#print "@array1\n";