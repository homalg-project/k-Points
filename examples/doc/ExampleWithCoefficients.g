LoadPackage( "k-Points" );

R := HomalgFieldOfRationalsInDefaultCAS( ) * "x,y";

A := R * "a,b,c";

mat := HomalgMatrix( "[ \
a*b^2*x^2+b^3*y^2+b^2*c*y+a^2*b,    \
a*b^2*x*y+a*b*c*y+a^4-a^3*c,        \
(a^3*b-a^2*b*c)*(x-y)+a^3*c-a^2*c^2 \
]", 3, 1, A );

u := Indeterminates( BaseRing( A ) );
