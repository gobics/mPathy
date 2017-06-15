
convert_Int.Kegg =
function( keggStr )
{
   as.integer( substring( keggStr, 2 ) )
}

convert_String.Kegg =
function( keggInt )
{
   sprintf( KEGG_FORMAT, keggInt )
}
