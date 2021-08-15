#!/bin/bash
#Post Install
package-cleanup --oldkernels --count=1
echo "CF_DNSAPI='y'" >> /etc/centminmod/custom_config.inc
echo "CF_KEY='uyhx7jNs242XCNia_sAo4uvtSajb-Hce7_nAjXi5'" >> /etc/centminmod/custom_config.inc
echo "CF_EMAIL='nattapoom.p@gmail.com'" >> /etc/centminmod/custom_config.inc
git config --global user.email "nattapoom@hotmail.com"
git config --global user.name "iDaemo"
echo "nattapoom.p@gamil.com" >> /etc/centminmod/email-primary.ini
echo "nattapoom@hotmail.com" >> /etc/centminmod/email-secondary.ini
#sed -i 's|^ #include /usr/local/nginx/conf/cloudflare.conf;| include /usr/local/nginx/conf/cloudflare.conf;|' /usr/local/nginx/conf/conf.d/cache-enabler.centminmod.com.ssl.conf
#nprestart
#cpupower frequency-set --governor performance
echo "DONE" 
