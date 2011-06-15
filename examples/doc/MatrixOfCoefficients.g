##  <#GAPDoc Label="MatrixOfCoefficients:example">
##  <Example><![CDATA[
##  gap> R := HomalgFieldOfRationalsInDefaultCAS( ) * "x,y";;
##  gap> A := R * "a,b,c";;
##  gap> mat := HomalgMatrix( "[ \
##  > a*b^2*x^2+b^3*y^2+b^2*c*y+a^2*b,    \
##  > a*b^2*x*y+a*b*c*y+a^4-a^3*c,        \
##  > (a^3*b-a^2*b*c)*(x-y)+a^3*c-a^2*c^2 \
##  > ]", 3, 1, A );
##  <A 3 x 1 matrix over an external ring>
##  gap> u := Indeterminates( BaseRing( A ) );
##  [ x, y ]
##  gap> c := MatrixOfCoefficients( mat, u );
##  <A ? x 1 matrix over an external ring>
##  gap> Display( c );
##  0,
##  a*b^2,
##  b^3,
##  b^2*c,
##  a^2*b,
##  a*b^2,
##  a*b*c,
##  a^4-a^3*c,
##  a^3*b-a^2*b*c,
##  -a^3*b+a^2*b*c,
##  a^3*c-a^2*c^2
##  ]]></Example>
##  <#/GAPDoc>

Read( "ExampleWithCoefficients.g" );

c := MatrixOfCoefficients( mat, u );

Display( c );
