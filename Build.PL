###############################################################################
#
#   Module::Build file for Catalyst::Model::ISBNDB
#
###############################################################################

use 5.008;
use strict;
use warnings;

use Module::Build;

my $class = Module::Build->subclass(
    class => 'Catalyst::Model::ISBNDB::Builder',
    code  => q|
        sub ACTION_dist
        {
            my $self = shift;

            # Create the text ChangeLog
            $self->do_system('changelog2x',
                             qw(--template text --input ChangeLog.xml),
                             qw(--output ChangeLog));
            # Create the text README
            $self->do_system('textile2x',
                             qw(--format plaintext
                                --input README.textile
                                --output README));

            $self->SUPER::ACTION_manifest();
            $self->SUPER::ACTION_dist();
        }
    |
);

my $builder = $class->new(
    module_name => 'Catalyst::Model::ISBNDB',
    license     => 'perl',
    dist_author => 'Randy J. Ray <rjray@blackperl.com>',
    dist_abstract =>
        'Catalyst model for accessing the isbndb.com REST interface',
    dist_version   => '0.22',
    build_requires => {'Test::More' => '0.80'},
    requires       => {
        'perl'               => '5.008',
        'NEXT'               => '0.6',
        'Catalyst::Runtime'  => '5.7',
        'WebService::ISBNDB' => '0.31',
    },
    add_to_cleanup => [
        qw(Catalyst-Model-ISBNDB-*
            ChangeLog
            MANIFEST
            MANIFEST.bak
            META.yml
            Makefile
            Makefile.PL
            *.log
            t/*.log
            README)
    ],
    meta_merge => {
        resources => {
            homepage => 'http://search.cpan.org/dist/Catalyst-Model-ISBNDB',
            bugtracker =>
                'http://rt.cpan.org/Public/Dist/Display.html?Name=Catalyst-Model-ISBNDB',
            repository =>
                'http://github.com/rjray/catalyst-model-isbndb/tree/master',
        }
    },

    create_makefile_pl => 'traditional',
    sign               => 'here, please',
);

$builder->create_build_script();

exit 0;
