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
        "for a homalg matrix over a graded ring and a list of variables",
        [ IsMatrixOverGradedRing, IsList ],
        
  function( mat, u )
    
    return MatrixOverGradedRing(
                   MatrixOfCoefficients(
                           UnderlyingMatrixOverNonGradedRing( mat ),
                           List( u, UnderlyingNonGradedRingElement ) ),
                   HomalgRing( mat ) );
    
end );

##
InstallMethod( MatrixOfCoefficients,
        "for a homalg matrix over a residue class ring and a list of variables",
        [ IsHomalgResidueClassMatrixRep, IsList ],
        
  function( mat, u )
    
    return HomalgResidueClassMatrix(
                   MatrixOfCoefficients(
                           Eval( mat ),
                           List( u, EvalRingElement ) ),
                   HomalgRing( mat ) );
    
end );

##  <#GAPDoc Label="IdealOfCoefficients:matrix">
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

##  <#GAPDoc Label="IdealOfCoefficients:morphism">
##  <ManSection>
##    <Oper Arg="mor,u" Name="IdealOfCoefficients" Label="for a morphism and a list of variables"/>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
InstallMethod( IdealOfCoefficients,
        "for a homalg morphism and a list of variables",
        [ IsHomalgMorphism, IsList ],
        
  function( mor, u )
    
    return IdealOfCoefficients( MatrixOfMap( mor ), u );
    
end );

##  <#GAPDoc Label="GradedIdealOfCoefficients:matrix">
##  <ManSection>
##    <Oper Arg="mat,u" Name="GradedIdealOfCoefficients" Label="for a matrix over a graded ring and a list of variables"/>
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

##  <#GAPDoc Label="GradedIdealOfCoefficients:morphism">
##  <ManSection>
##    <Oper Arg="mor,u" Name="GradedIdealOfCoefficients" Label="for a morphism of graded modules and a list of variables"/>
##    <Description>
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
InstallMethod( GradedIdealOfCoefficients,
        "for a homalg morphism and a list of variables",
        [ IsHomalgMorphism, IsList ],
        
  function( mor, u )
    
    return GradedIdealOfCoefficients( MatrixOfMap( mor ), u );
    
end );

##  <#GAPDoc Label="AssociatedPrimes">
##  <ManSection>
##    <Oper Arg="I" Name="AssociatedPrimes" Label="for an ideal"/>
##    <Description>
##      <#Include Label="AssociatedPrimes:example">
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
InstallMethod( AssociatedPrimes,
        "for an ideal",	## IsHomalgModule also covers the graded case
        [ IsHomalgModule and ConstructedAsAnIdeal ],
        
  function( I )
    
    return List( PrimaryDecomposition( I ), a -> a[2] );
    
end );

##
InstallMethod( AssociatedMaximalIdeals,
        "for an ideal",	## IsHomalgModule also covers the graded case
        [ IsHomalgModule and ConstructedAsAnIdeal ],
        
  function( I )
    local R, dim, Ass;
    
    R := HomalgRing( I );
    
    if not HasKrullDimension( R ) then
        TryNextMethod( );
    fi;
    
    dim := KrullDimension( R );
    
    Ass := AssociatedPrimes( I );
    
    return Filtered( Ass, P -> Grade( FactorObject( P ) ) = dim );
    
end );

##  <#GAPDoc Label="AssociatedPrimesOfMaximalCodimension">
##  <ManSection>
##    <Oper Arg="I" Name="AssociatedPrimesOfMaximalCodimension" Label="for an ideal"/>
##    <Description>
##      <#Include Label="AssociatedPrimesOfMaximalCodimension:example">
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
InstallMethod( AssociatedPrimesOfMaximalCodimension,
        "for an ideal",	## IsHomalgModule also covers the graded case
        [ IsHomalgModule and ConstructedAsAnIdeal ],
        
  function( I )
    local Ass, max_depth;
    
    Ass := AssociatedPrimes( I );
    
    max_depth := Maximum( List( Ass, P -> Grade( FactorObject( P ) ) ) );
    
    return Filtered( Ass, P -> Grade( FactorObject( P ) ) = max_depth );
    
end );

##  <#GAPDoc Label="APoint">
##  <ManSection>
##    <Oper Arg="I" Name="APoint" Label="for an ideal"/>
##    <Description>
##      <#Include Label="APoint:example">
##    </Description>
##  </ManSection>
##  <#/GAPDoc>
InstallMethod( APoint,
        "for an ideal",	## IsHomalgModule also covers the graded case
        [ IsFinitelyPresentedSubmoduleRep and ConstructedAsAnIdeal ],
        
  function( I )
    local Ass;
    
    Ass := AssociatedPrimesOfMaximalCodimension( I );
    
    if Ass = [ ] then
        return false;
    fi;
    
    return Ass[1];
    
end );
