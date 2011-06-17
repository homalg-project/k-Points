##  <#GAPDoc Label="AssociatedPrimes:example">
##  <Example><![CDATA[
##  gap> A := HomalgFieldOfRationalsInDefaultCAS( ) * "a,b,c";;
##  gap> I := LeftSubmodule( "b^2*c,a*b*c,b^3,a*b^2,a^2*b,a^3*c-a^2*c^2,a^4-a^2*c^2", A );
##  <A torsion-free (left) ideal given by 7 generators>
##  gap> Ass := AssociatedPrimes( I );
##  [ <A torsion-free (left) ideal given by 2 generators>,
##    <A torsion-free (left) ideal given by 2 generators>, 
##    <A torsion-free (left) ideal given by 3 generators> ]
##  gap> Perform( Ass, Display );
##  b,
##  a 
##  
##  A (left) ideal generated by the 2 entries of the above matrix
##  b, 
##  a-c
##  
##  A (left) ideal generated by the 2 entries of the above matrix
##  c,
##  b,
##  a 
##  
##  A (left) ideal generated by the 3 entries of the above matrix
##  ]]></Example>
##  <#/GAPDoc>

LoadPackage( "k-Points" );

A := HomalgFieldOfRationalsInDefaultCAS( ) * "a,b,c";

I := LeftSubmodule( "b^2*c,a*b*c,b^3,a*b^2,a^2*b,a^3*c-a^2*c^2,a^4-a^2*c^2", A );

Ass := AssociatedPrimes( I );

Perform( Ass, Display );