#############################################################################
##
##  Tools.gi                                                k-Points package
##
##  Copyright 2011, Mohamed Barakat, University of Kaiserslautern
##
##  Implementations of tool procedures.
##
#############################################################################

####################################
#
# global variables:
#
####################################

HOMALG_IO.Pictograms.MatrixOfCoefficients := "mcf";

####################################
#
# methods for operations:
#
####################################

##  <#GAPDoc Label="MatrixOfCoefficients">
##  <ManSection>
##    <Oper Arg="mat,u" Name="MatrixOfCoefficients" Label="for a matrix and a list of variables"/>
##    <Description>
##      <#Include Label="MatrixOfCoefficients:example">
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
InstallMethod( MatrixOfCoefficients,
        "for a homalg matrix and a list of variables",
        [ IsHomalgMatrix, IsList ],
        
  function( mat, u )
    local A, RP, coeffs;
    
    A := HomalgRing( mat );
    
    RP := homalgTable( A );
    
    if not IsBound( RP!.MatrixOfCoefficients ) then
        Error( "could not find a procedure called MatrixOfCoefficients in the homalgTable of the ring\n" );
    fi;
    
    coeffs := RP!.MatrixOfCoefficients( mat, u );	## the external object
    
    return HomalgMatrix( coeffs, "unkown_number_of_rows", 1, A );
    
end );
