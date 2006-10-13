###############################################################################
#
# $Id$
#
# This is the MakeMaker skeleton for Catalyst::Plugin::ISBNDB, a wrapper around
# Module::Build.
#
###############################################################################

use Module::Build::Compat;
Module::Build::Compat->run_build_pl(args => \@ARGV);
Module::Build::Compat->write_makefile();
