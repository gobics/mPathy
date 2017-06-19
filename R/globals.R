PCKG_NAME = 'mPathy'
PCKG_VERSION = '1.0'
PCKG_PATH = system.file( getPackageName() )

CONFIG_NAME = paste( c( PCKG_NAME, 'conf' ), collapse = '.' )
CONFIG_PATH = file.path( path.expand( '~' ), paste( c ( '.', PCKG_NAME ), collapse = '' ) )
CONFIG_TEMP = file.path( PCKG_PATH, CONFIG_NAME )
CONFIG_FILE = file.path( path.expand( '~' ), CONFIG_NAME )
CONFIG_FILE_COMMENT = '#'
CONFIG_FILE_ENTRY_PATTERN = '\\[(.+)\\][[:space:]]+(.*)'
CONFIG_FILE_ENTRY_FORMATTER = '[%s] %s'
DATA_PATH=file.path( PCKG_PATH, "data" )

CONFIG_FILE_HASH = toupper('02ea73642806879826c9bc796812ad7a34fd55ef20d3be6af93884f041838163f03fdfa49d78d318d628349505878b468f0c894c92d09290081d49829abc42db')


KEGG_FORMAT='K%05d'


