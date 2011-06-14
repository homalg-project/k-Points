#############################################################################
##
##  SingularTools.gi                                        k-Points package
##
##  Copyright 2011, Mohamed Barakat, University of Kaiserslautern
##
##  Implementations for the rings provided by Singular.
##
#############################################################################

####################################
#
# global variables:
#
####################################

##
InstallValue( k_PointsMacrosForSingular,
        rec(
            
    _CAS_name := "Singular",
    
    _Identifier := "k-Points",
    
    )

);

##
UpdateMacrosOfCAS( k_PointsMacrosForSingular, SingularMacros );
UpdateMacrosOfLaunchedCASs( k_PointsMacrosForSingular );

##
InstallValue( k_PointsTableForSingularTools,
        
        rec(
               
        )
 );

## enrich the global homalg table for Singular:
AppendToAhomalgTable( CommonHomalgTableForSingularTools, k_PointsTableForSingularTools );
AppendTohomalgTablesOfCreatedExternalRings( k_PointsTableForSingularTools, IsHomalgExternalRingInSingularRep );
