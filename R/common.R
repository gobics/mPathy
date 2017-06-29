# CONTAINS COMMON METHODS IE. SYNTACTIC SUGAR

print.File =
function( fileName )
{
   fileHandle = file ( fileName )
   cat( readLines( fileHandle ), sep = '\n' )
   close( fileHandle )
}

concat =
function( ... )
{
   paste( c( ... ), collapse = '' )
}

# ******************************************************************************
# BEGIN  :  CONFIG FILE OPERATIONS
# *****************************************************************************{

load.ConfigFile = 
function()
{
    if ( check.ConfigFile() )
       load.ConfigFile.Keys( read.ConfigFile.Keys() )
    else
      stop( 'FAILED TO LOAD/CREATE CONFIG FILE!')
}

check.ConfigFile =
function()
{
    if ( ! file.exists( CONFIG_FILE ) )
        return( create.ConfigFile() )

    if ( ! isValid.ConfigFile() )
        return( FALSE )
    
    TRUE
}

isValid.ConfigFile =
function()
{
    lines = readLines( CONFIG_FILE )

    return(
    ( length(lines) > 2 )
    &&
    ( gsub( CONFIG_FILE_COMMENT, '', lines[ 1 ] ) == CONFIG_FILE_HASH ) 
    &&
    ( gsub( CONFIG_FILE_COMMENT, '', lines[ 2 ] ) == PCKG_VERSION )
    )
}

create.ConfigFile =
function()
{
   print(CONFIG_TEMP)
   print(CONFIG_FILE)

   print( file.exists(CONFIG_TEMP))

   print(readLines(CONFIG_TEMP))

    return(
    dir.create(
         CONFIG_PATH,
         showWarnings = TRUE,
         )
   &&
    file.copy(
         CONFIG_TEMP,
         CONFIG_FILE,
         overwrite = TRUE
         )
    )
}

edit.ConfigFile.Keys = 
function( ... )
{
    keys = names( c( ... ) )

    pair = read.ConfigFile.Keys()

    keepIdx = which( ! pair[ , 1 ] %in% keys )

    keys = c( pair[ keepIdx, 1], keys )
    values = c( pair[ keepIdx, 2], ... )

    headerLines = c(
        concat( CONFIG_FILE_COMMENT, CONFIG_FILE_HASH ),
        concat( CONFIG_FILE_COMMENT, PCKG_VERSION )
    )
    contentLines = sprintf( CONFIG_FILE_ENTRY_FORMATTER, keys, values )

    configFile = file( CONFIG_FILE, open = 'wt' )
    tryCatch(
        writeLines( c(headerLines, contentLines), configFile ),
        error = function(e)
        {
            FILE_WRITE_ERROR$new( file = CONFIG_FILE )$throw()
        },
        finally = close.connection( configFile )
        )

    load.ConfigFile.Keys( cbind( keys, values ) )

    invisible()
}

read.ConfigFile.Keys = 
function()
{
    lines = readLines(CONFIG_FILE)
    
    # REMOVE COMMENTARY LINES
    lines = grep(concat('^[^', CONFIG_FILE_COMMENT, ']'), lines, value = TRUE)

    varKeys = gsub(CONFIG_FILE_ENTRY_PATTERN, '\\1', lines)
    varValues = gsub(CONFIG_FILE_ENTRY_PATTERN, '\\2', lines)

    cbind( varKeys, varValues )
}

load.ConfigFile.Keys = 
function( Pairs )
{
   apply(
      Pairs,
      1,
      function( pair )
      {
         assign( 
         pair[ 1 ], 

         #{
         if ( grepl( '^[[:digit:]]+\\.{0,1}[[:digit:]]*$', pair[ 2 ] ) )
            as.numeric( pair[ 2 ] ) 
         else
            if ( pair[ 2 ] == 'NULL' )
               NULL
            else
               pair[ 2 ],

         envir = ._CONFIG 
         )
      }
   )
}

# *****************************************************************************}
# END    :  CONFIG FILE OPERATIONS
# ******************************************************************************
