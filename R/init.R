# THIS FILE CONTAINS STATIC VARIABLES MEANING THEY ARE AVAILABLE THROUGH THE
# HOLE APPLICATION. THEY ARE ALSO INITIALIZED HERE AND FURTHERMORE THIS IS
# THE PLACE WHERE THE _.onLoad()_ FUNCTION RESIDES.

._CONFIG = new.env()

.onLoad =
function( libName, pkgName )
{
   # init config environment
   rm( list = ls( ._CONFIG ), envir = ._CONFIG )
   load.ConfigFile()

   if ( ._CONFIG$SHOW_LICENSE_TEXT )
   {
      print.File( LICENCE_FILE )
   }

   if ( ._CONFIG$SHOW_VERSION )
   {
      cat(
      "Welcome to ",
      PCKG_TITLE,
      " Version: ",
      PCKG_VERSION,
      '\n'
      )
   }

   if ( ._CONFIG$SHOW_USAGE )
   {
      print.File( USAGE_FILE )
   }
}
