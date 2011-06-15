#############################################################################
##
##  k-Points.gi                                             k-Points package
##
##  Copyright 2011, Mohamed Barakat, University of Kaiserslautern
##
##  Implementations for k-points.
##
#############################################################################

####################################
#
# methods for operations:
#
####################################

##
InstallMethod( MatrixOfCoefficients,
        "for a homalg matrix and a list of variables",
        [ IsMatrixOverGradedRing, IsList ],
        
  function( mat, u )
    
    return MatrixOverGradedRing(
                   MatrixOfCoefficients(
                           UnderlyingMatrixOverNonGradedRing( mat ),
                           List( u, UnderlyingNonGradedRingElement ) ),
                   HomalgRing( mat ) );
    
end );

##  <#GAPDoc Label="IdealOfCoefficients">
##  <ManSection>
##    <Oper Arg="mat,u" Name="IdealOfCoefficients" Label="for a matrix and a list of variables"/>
##    <Description>
##      <#Include Label="IdealOfCoefficients:example">
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
InstallMethod( IdealOfCoefficients,
        "for a homalg matrix and a list of variables",
        [ IsHomalgMatrix, IsList ],
        
  function( mat, u )
    
    return LeftSubmodule( BasisOfRows( MatrixOfCoefficients( mat, u ) ) );
    
end );

##  <#GAPDoc Label="GradedIdealOfCoefficients">
##  <ManSection>
##    <Oper Arg="mat,u" Name="GradedIdealOfCoefficients" Label="for a matrix and a list of variables"/>
##    <Description>
##      <#Include Label="GradedIdealOfCoefficients:example">
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
InstallMethod( GradedIdealOfCoefficients,
        "for a homalg matrix and a list of variables",
        [ IsHomalgMatrix, IsList ],
        
  function( mat, u )
    
    return GradedLeftSubmodule( BasisOfRows( MatrixOfCoefficients( mat, u ) ) );
    
end );
