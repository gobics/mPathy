PCKG_NAME = 'mPathy'
PCKG_VERSION = '1.0.0'
PCKG_TITLE = 'mPathy : Ultrafast pathway reconstruction from metagenomic and metatranscriptomic reads'

CONFIG_NAME = paste( c( PCKG_NAME, 'conf' ), collapse = '.' )
CONFIG_PATH = file.path( path.expand( '~' ), paste( c ( '.', PCKG_NAME ), collapse = '' ) )
CONFIG_TEMP = system.file( CONFIG_NAME, package=getPackageName() )
CONFIG_FILE = file.path( CONFIG_PATH, CONFIG_NAME )
CONFIG_FILE_COMMENT = '#'
CONFIG_FILE_ENTRY_PATTERN = '\\[(.+)\\][[:space:]]+(.*)'
CONFIG_FILE_ENTRY_FORMATTER = '[%s] %s'
DATA_PATH=file.path( system.file( 'data', package=getPackageName() ) )
CONFIG_FILE_HASH = toupper('02ea73642806879826c9bc796812ad7a34fd55ef20d3be6af93884f041838163f03fdfa49d78d318d628349505878b468f0c894c92d09290081d49829abc42db')

LICENCE_FILE=system.file('LICENCE', package=getPackageName())
USAGE_FILE=system.file('README.md', package=getPackageName())

KEGG_FORMAT='K%05d'


