#!/opt/local/bin/perl

use strict;
use feature qw(say);
use Bio::Seq;
use Bio::SeqIO;
use List::Util 'shuffle';

print "File: ";
my $userinput = <STDIN>;
chomp $userinput;
my @aa;
my $seqio_obj = Bio::SeqIO->new(-file => "$userinput",
								-format => "fasta" 
								);
								

while (my $seq_obj = $seqio_obj->next_seq)
{
	my $seqs = $seq_obj->seq;	
	my $ids = $seq_obj->id;	

	while ($seqs =~ /([a-z])/gi)
		{push @aa, "$1";}
	print ">$ids\n";
	print $_, foreach shuffle @aa;
	print "\n";
	@aa = ();

}
