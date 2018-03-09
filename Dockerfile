FROM saoneth/php:7.2-fpm

RUN \
   mv /usr/local/bin/php /usr/local/bin/php-cli \
   && echo -e '#!/bin/sh\n/usr/local/bin/php-cli "$@"' > /usr/local/bin/php \
   && chmod +x /usr/local/bin/php

ENTRYPOINT ["/usr/local/bin/php"]

CMD ["-a"]
