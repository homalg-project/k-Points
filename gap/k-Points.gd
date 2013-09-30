#############################################################################
##
##  k-Points.gd                                             k-Points package
##
##  Copyright 2011, Mohamed Barakat, University of Kaiserslautern
##
##  Declarations for k-points.
##
#############################################################################

####################################
#
# attributes:
#
####################################

####################################
#
# global functions and operations:
#
####################################

# constructors:

# basic operations:

DeclareOperation( "IdealOfCoefficients",
        [ IsHomalgMatrix, IsList ] );

DeclareOperation( "IdealOfCoefficients",
        [ IsHomalgMorphism, IsList ] );

DeclareOperation( "GradedIdealOfCoefficients",
        [ IsHomalgMatrix, IsList ] );

DeclareOperation( "GradedIdealOfCoefficients",
        [ IsHomalgMorphism, IsList ] );

DeclareOperation( "APoint",
        [ IsHomalgModule ] );

####################################
#
# synonyms:
#
####################################

