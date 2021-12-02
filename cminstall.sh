#!/bin/bash
setenforce 0
mkdir -p /etc/centminmod
touch /etc/centminmod/custom_config.inc
EMAIL=nattapoom.p@gmail.com
echo "DISABLE_IPVSIX='y'" >> /etc/centminmod/custom_config.inc
#echo "PUSHOVER_EMAIL='nattapoom.p@gmail.com'" >> /etc/centminmod/custom_config.inc
echo "ENABLEMOTD_CSFMSG='n'" >> /etc/centminmod/custom_config.inc # motd banner csf message alert disaply
echo "ENABLEMOTD_LINKSMSG='n'" >> /etc/centminmod/custom_config.inc  # motd centminmod.com links bookmark alert display
echo "FPM_WAKEUP_PATCH='y'" >> /etc/centminmod/custom_config.inc
echo "DEVTOOLSETSIX='n'" >> /etc/centminmod/custom_config.inc
echo "DEVTOOLSETSEVEN='n'" >> /etc/centminmod/custom_config.inc
echo "DEVTOOLSETEIGHT='n'" >> /etc/centminmod/custom_config.inc
echo "DEVTOOLSETNINE='y'" >> /etc/centminmod/custom_config.inc
echo "NGINX_DEVTOOLSETGCC='y'" >> /etc/centminmod/custom_config.inc
echo "CLANG='n'" /etc/centminmod/custom_config.inc
echo "LIBRESSL_SWITCH='n'" >> /etc/centminmod/custom_config.inc
#echo "MARCH_TARGETNATIVE_ALWAYS='y'" >> /etc/centminmod/custom_config.inc
echo "NSD_INSTALL='n'" >> /etc/centminmod/custom_config.inc
echo "NSD_DISABLED='y'" >> /etc/centminmod/custom_config.inc
#echo "NGINX_HPACK='y'" >> /etc/centminmod/custom_config.inc
echo "PUREFTPD_DISABLED='y'" >> /etc/centminmod/custom_config.inc
echo "PUREFTPD_INSTALL='n'" >> /etc/centminmod/custom_config.inc
#echo "CUSTOMSERVERSTRING='nginx'" >> /etc/centminmod/custom_config.inc
echo "MARIADB_INSTALLTENFOUR='y'" >> /etc/centminmod/custom_config.inc #mariadb version allow
echo "VHOSTCTRL_CLOUDFLAREINC='y'" >> /etc/centminmod/custom_config.inc
#echo "WPPLUGINS_ALL='n'" >> /etc/centminmod/custom_config.inc
echo "CUSTOM_CURLRPM='y'" >> /etc/centminmod/custom_config.inc
echo "CUSTOM_CURLRPMVER='7.69.0'" >> /etc/centminmod/custom_config.inc # custom curl/libcurl version
echo "NGINX_IOURING_PATCH='y'" >> /etc/centminmod/custom_config.inc
echo "NGINX_SSLCACHE_ALLOWOVERRIDE='y'" >> /etc/centminmod/custom_config.inc
echo "NGINX_STAPLE_CACHE_OVERRIDE='y'" >> /etc/centminmod/custom_config.inc
echo "NGINX_STAPLE_CACHE_TTL='86400'" >> /etc/centminmod/custom_config.inc
echo "NGINX_LIBBROTLI='y'" >> /etc/centminmod/custom_config.inc
echo "NGXDYNAMIC_BROTLI='y'" >> /etc/centminmod/custom_config.inc
#echo "SET_DEFAULT_MYSQLCHARSET='utf8mb4'" >> /etc/centminmod/custom_config.inc
echo "AUTOHARDTUNE_NGINXBACKLOG='y'" >> /etc/centminmod/custom_config.inc
echo "ZSTD_LOGROTATE_NGINX='y'" >> /etc/centminmod/custom_config.inc
echo "ZSTD_LOGROTATE_PHPFPM='y'" >> /etc/centminmod/custom_config.inc
echo "LETSENCRYPT_DETECT='y'" >> /etc/centminmod/custom_config.inc
echo "DUALCERTS='y'" >> /etc/centminmod/custom_config.inc
echo "SELFSIGNEDSSL_ECDSA='y'" >> /etc/centminmod/custom_config.inc
echo "NGINX_ZERODT='y'" >> /etc/centminmod/custom_config.inc #nginx zero downtime
echo "PHP_TUNING='y'" >> /etc/centminmod/custom_config.inc
echo "PHP_PGO_ALWAYS='y'" >> /etc/centminmod/custom_config.inc
echo "PHP_PGO='y'" >> /etc/centminmod/custom_config.inc
echo "PHP_BROTLI='y'" >> /etc/centminmod/custom_config.inc
echo "PHP_LZFOUR='y'" >> /etc/centminmod/custom_config.inc~
echo "PHP_LZF='y'" >> /etc/centminmod/custom_config.inc
echo "PHP_ZSTD='y'" >> /etc/centminmod/custom_config.inc
echo "PHPFINFO='y'" >> /etc/centminmod/custom_config.inc
echo "AUTODETECPHP_OVERRIDE='y'" >> /etc/centminmod/custom_config.inc
echo "WPCLI_CE_QUERYSTRING_INCLUDED='y'" >> /etc/centminmod/custom_config.inc
echo "AUDITD_ENABLE='y'" >> /etc/centminmod/custom_config.inc
echo "AUTOTUNE_CLIENTMAXBODY='y'" >> /etc/centminmod/custom_config.inc
yum -y update; curl -O https://centminmod.com/betainstaller81.sh && chmod 0700 betainstaller81.sh && bash betainstaller81.sh
/usr/local/src/centminmod/tools/auditd.sh setup
/usr/local/src/centminmod/tools/csf-advancetweaks.sh
csf --profile backup backup-b4-customregex
cp -a /usr/local/csf/bin/regex.custom.pm /usr/local/csf/bin/regex.custom.pm.bak
egrep 'CUSTOM1_LOG|CUSTOM2_LOG|CUSTOM3_LOG|CUSTOM4_LOG' /etc/csf/csf.conf
sed -i "s|CUSTOM1_LOG = .*|CUSTOM1_LOG = \"/home/nginx/domains/\*/log/access.log\"|" /etc/csf/csf.conf
sed -i "s|CUSTOM2_LOG = .*|CUSTOM2_LOG = \"/home/nginx/domains/\*/log/error.log\"|" /etc/csf/csf.conf
sed -i "s|CUSTOM3_LOG = .*|CUSTOM3_LOG = \"/var/log/nginx/localhost.access.log\"|" /etc/csf/csf.conf
sed -i "s|CUSTOM4_LOG = .*|CUSTOM4_LOG = \"/var/log/nginx/localhost.error.log\"|" /etc/csf/csf.conf
egrep 'CUSTOM1_LOG|CUSTOM2_LOG|CUSTOM3_LOG|CUSTOM4_LOG' /etc/csf/csf.conf
wget -O /usr/local/csf/bin/regex.custom.pm https://gist.github.com/centminmod/f5551b92b8aba768c3b4db84c57e756d/raw/regex.custom.pm
csf -ra
sed -i "s|EMAIL=.*|EMAIL='$EMAIL'|" /etc/cron.daily/diskalert #set disk alert
openssl dhparam -out /usr/local/nginx/conf/ssl/dhparam.pem 2048
echo "Done!"

###############################################################
# centmin.sh menu option 22 specific options
#WPPLUGINS_ALL='n'           # do not install additional plugins
#WPCLI_CE_QUERYSTRING_INCLUDED='n' # https://community.centminmod.com/posts/85893/
#WPCLI_SUPERCACHEPLUGIN='n'  # https://community.centminmod.com/threads/5102/
# choose Cache Enabler 1.4.9 cache query string inclusion set to 'y'
# choose Cache Enabler 1.5.1 cache query string exclusion set to 'n'
#CACHE_ENABLER_LEGACY_CACHE='y'
###############################################################
