FROM		livelace/sip2world-cdr-stats:3.0.0	
MAINTAINER	o.popov@livelace.ru

WORKDIR		/opt/cdr-stats-develop/cdr_stats

CMD		["python", "/opt/cdr-stats-develop/cdr_stats/manage.py", "celery", "beat", "-l", "info"]
