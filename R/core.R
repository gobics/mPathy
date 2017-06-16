# MAIN ENTRY POINT FOR THE PACKAGE. READS FILES AND DOES THE CORE OF COMPUTATION, EG. ASSIGNING
# READS TO TAXONOMIES AND KEGG ORTHOLOGS IE. CREATING COUNTS. CONDITIONS MAY BE PROVIDED AS
# `1`-BASED VECTOR OF NUMBERS. THE TYPE MIGHT BE EITHER FASTA OR UPROC 
mPathy.buildObject =
function( files, type, mPObjFile, conditions = rep( 1, length( files ) ) )
{
   # TODO: @heiner - dummy stub
}

# WRITES KEGG-ORTHOLOG-TABLES, MAP-TABLES AND PATHWAY-MAPS BELONGING AS BROWSABLE HTML FILES TO THE
# PROVIDED OUTPUT PATH
mPathy.writeOutput =
function( mPObjFile, outPath, force = FALSE )
{
   # TODO: @sebastian - dummy stub
}

# ENABLES THE USER TO MODIFY A _MPATHYOBJECT_ PROVIDED AS AN _RDS-FILE_
mPathy.interactive =
function( mPObjFile )
{
   # TODO: @heiner - dummy stub
}

# ENABLES THE USER TO CHANGE KEYS IN THE _MPATHY_ CONFIG FILE. EXPECTS ONE ORE MORE NAMED ARGUMENTS
# WHERE THE NAME HAS TO BE A KEY IN THE CONFIG FILE.
mPathy.configure =
function( ... )
{
   if ( length( c( ... ) ) == 0 )
      return()

   edit.ConfigFile.Keys( ... )
}
