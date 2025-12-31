PRINT '--------------------------------'
PRINT 'BEGIN Post-Deployment Script'
PRINT '--------------------------------'

:r "./objects/abc/functions/GetHello2.function.sql"

:r "./objects/xyz/seeds/SystemActions.seed.sql"
:r "./objects/xyz/functions/GetMainActions.function.sql"

PRINT '--------------------------------'
PRINT 'END Post-Deployment Script'
PRINT '--------------------------------'