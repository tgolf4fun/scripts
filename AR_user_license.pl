####################################################################################
#Script used to validate that AP-Admin users have the correct license type##########
#used for the Remedy Admin duties###################################################
#Written by Tracy Thorn v1.0########################################################
#Created October 19,2004############################################################
#Last revision######################################################################
####################################################################################
use strict;
use warnings;
use Tie::RefHash;

########################################
#Variables used
########################################
my $file_ap;
my $hash_in;
my $output;
my $text;
my $fh;
my @list;
my $item;
my $i;
my $seen;
my %seen;
my @single;
my @ar_user_lic;
my $ar_user_lic;
my $hash;
my %hash;
my $k;	

print "################################################################################";
print "#Script used to validate that AP-Admin users have the correct license type     #";
print "#used for the Remedy Admin duties                                              #";
print "#Written by Tracy Thorn v1.0                                                   #";
print "#Created October 19,2004                                                       #";
print "#Last revision                                                                 #";
print "################################################################################";
print "\n";
print "\n";
print "\n";

###############################################
#Obtain input and outpout file name
###############################################

print "Enter the path where AP Role extract .txt file is:\n\n";
	$file_ap = <STDIN>;
	{
                local( $/ ) ;
                open( $fh, $file_ap ) or die "Error, file does not exist $!\n";
		$text = <$fh>
        }

print "Enter the path where the User & License Type extract .txt file is:\n\n";
	$hash_in = <STDIN>;

print "Please enter the name and where you want the output file saved:\n\n";
	$output = <STDIN>;

###################################################
#assign input from $file_ap to an array
###################################################

	@list = split(/;/,$text); 

###################################################
#Clean up the array so that it contains only UID's
###################################################

foreach $item (@list) {			
		$item =~ s/^\(CHG_.*//gm;
		      }

foreach $item (@list) {
		$item =~ s/\n//g;
		      }		

###################################################
#Remove duplicates from the array and push the 
#individual UID's to an new array
###################################################

foreach $i (@list) {
	unless ($seen{$i}) {
	$seen{$i} = 1;
	push (@single,"$i\n");
		}
	}


####################################################
#Because this is a script running on a Windows 
#system, we have to tie the hash values to the keys
#so the values in the %hash do not get stringified
####################################################

tie %hash,"Tie::RefHash"; 

#####################################################
#Open variable from input above and create a hash of
#UID's and their license type
#####################################################
	
open (DATA,"<$hash_in") or die "Error, file does not exist $!"; 
	while (<DATA>){ 
	push (@ar_user_lic,$_); 
	@ar_user_lic = split(/\s/); 
	$hash{$ar_user_lic[0]} = $ar_user_lic[1]; 
}
######################################################
#Create a hash out of the single array for comparison
######################################################

foreach $item(@single) {$seen {$item} = 1 }

######################################################
#Compare %hash to %seen and delete the keys from hash
#if not seen in the seen hash, this deletion delets 
#keys and values so that what remains are the UID's 
#and license types of users from the AP:Role file
#######################################################

foreach $k(keys %hash){
		delete ($hash{$k}) unless exists $seen{$k};
				      }

#######################################################
#Print output to file using file name from <STOUT>
#######################################################

open STDOUT, "> $output" or die "Could not write to file $!\n";
print "$_ , $hash{$_}\n" for sort (keys %hash);
#######################################################