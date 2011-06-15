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
    
    MatrixOfCoefficients := "\
proc MatrixOfCoefficients (matrix mat, poly u)\n\
{\n\
  matrix Coeffs[1][0];\n\
  matrix c;\n\
  int i; int j;\n\
  for(i=1; i<=ncols(mat); i++){\n\
    for(j=1; j<=nrows(mat); j++){\n\
      c = coef(mat[j,i],u);\n\
      c = submat(c,2..2,1..ncols(c));\n\
      print(c);\n\
      Coeffs = concat(Coeffs,c);\n\
    };\n\
  };\n\
  return(Coeffs);\n\
}\n\n",
    
    )

);

##
UpdateMacrosOfCAS( k_PointsMacrosForSingular, SingularMacros );
UpdateMacrosOfLaunchedCASs( k_PointsMacrosForSingular );

##
InstallValue( k_PointsTableForSingularTools,
        
        rec(
               MatrixOfCoefficients :=
                 function( mat, u )
                   
                   u := Product( u );
                   
                   u := u / HomalgRing( mat );
                   
                   return homalgSendBlocking( [ "MatrixOfCoefficients(", mat, u, ")" ], [ "matrix" ], HOMALG_IO.Pictograms.MatrixOfCoefficients );
                   
                 end,
        )
 );

## enrich the global homalg table for Singular:
AppendToAhomalgTable( CommonHomalgTableForSingularTools, k_PointsTableForSingularTools );
AppendTohomalgTablesOfCreatedExternalRings( k_PointsTableForSingularTools, IsHomalgExternalRingInSingularRep );
