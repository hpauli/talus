#!/usr/bin/bash
#***********************************************************
#ansible awx-pauli -m command -a ping
#***********************************************************
rm /var/lib/awx/projects/talus/share_out

echo "*** Shares from vserver svm_ta_cifs !!!      ***"
ssh ansible@tacluster01 "vserver cifs share show -vserver svm_ta_cifs -share-name *scan* -fields share-name,path"  >> /var/lib/awx/projects/talus/share_out

echo "*** Shares from vserver svm_tb_cifs !!!      ***"
ssh ansible@tbcluster01 "vserver cifs share show -vserver svm_tb_cifs -share-name *scan* -fields share-name,path"  >> /var/lib/awx/projects/talus/share_out

echo "*** cat /var/lib/awx/projects/talus/share_out***"
cat /var/lib/awx/projects/talus/share_out | grep svm_ta_cifs | awk '{print $2}' > /var/lib/awx/projects/talus/shares_for_svm_ta_cifs

cat /var/lib/awx/projects/talus/share_out | grep svm_tb_cifs | awk '{print $2}' > /var/lib/awx/projects/talus/shares_for_svm_tb_cifs

