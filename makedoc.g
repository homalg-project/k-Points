##  this creates the documentation, needs: GAPDoc package, latex, pdflatex,
##  mkindex, dvips
##  
##  Call this with GAP.
##

LoadPackage( "GAPDoc" );

SetGapDocLaTeXOptions( "utf8" );

bib := ParseBibFiles( "doc/k-Points.bib" );
WriteBibXMLextFile( "doc/k-PointsBib.xml", bib );

Read( "ListOfDocFiles.g" );

MakeGAPDocDoc( "doc", "k-PointsForHomalg", list, "k-PointsForHomalg" );

GAPDocManualLab("k-Points");

quit;

