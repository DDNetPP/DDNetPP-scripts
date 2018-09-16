#!/bin/bash
while :
do
    rm latest_accounts/accounts_backup.db #oldest
    mv latest_accounts/accounts_backup1.db latest_accounts/accounts_backup.db
    mv latest_accounts/accounts_backup2.db latest_accounts/accounts_backup1.db
    mv latest_accounts/accounts_backup3.db latest_accounts/accounts_backup2.db
    mv latest_accounts/accounts_backup4.db latest_accounts/accounts_backup3.db
    mv latest_accounts/accounts_backup5.db latest_accounts/accounts_backup4.db
    mv latest_accounts/accounts_backup6.db latest_accounts/accounts_backup5.db
    mv latest_accounts/accounts_backup7.db latest_accounts/accounts_backup6.db
    mv latest_accounts/accounts_backup8.db latest_accounts/accounts_backup7.db
    mv latest_accounts/accounts_backup9.db latest_accounts/accounts_backup8.db
    mv latest_accounts/accounts_backup10.db latest_accounts/accounts_backup9.db
    mv latest_accounts/accounts_backup11.db latest_accounts/accounts_backup10.db
    mv latest_accounts/accounts_backup12.db latest_accounts/accounts_backup11.db
    mv latest_accounts/accounts_backup13.db latest_accounts/accounts_backup12.db
    mv latest_accounts/accounts_backup14.db latest_accounts/accounts_backup13.db
    mv latest_accounts/accounts_backup15.db latest_accounts/accounts_backup14.db
    mv latest_accounts/accounts_backup16.db latest_accounts/accounts_backup15.db
    mv latest_accounts/accounts_backup17.db latest_accounts/accounts_backup16.db
    mv latest_accounts/accounts_backup18.db latest_accounts/accounts_backup17.db
    mv latest_accounts/accounts_backup19.db latest_accounts/accounts_backup18.db
    mv latest_accounts/accounts_backup20.db latest_accounts/accounts_backup19.db
    mv latest_accounts/accounts_backup21.db latest_accounts/accounts_backup20.db
    mv latest_accounts/accounts_backup22.db latest_accounts/accounts_backup21.db
    mv latest_accounts/accounts_backup23.db latest_accounts/accounts_backup22.db
    mv latest_accounts/accounts_backup24.db latest_accounts/accounts_backup23.db
    mv latest_accounts/accounts_backup25.db latest_accounts/accounts_backup24.db
    mv latest_accounts/accounts_backup26.db latest_accounts/accounts_backup25.db
    mv latest_accounts/accounts_backup27.db latest_accounts/accounts_backup26.db
    mv latest_accounts/accounts_backup28.db latest_accounts/accounts_backup27.db
    mv latest_accounts/accounts_backup29.db latest_accounts/accounts_backup28.db
    mv latest_accounts/accounts_backup30.db latest_accounts/accounts_backup29.db
    mv latest_accounts/accounts_backup31.db latest_accounts/accounts_backup30.db
    mv latest_accounts/accounts_backup32.db latest_accounts/accounts_backup31.db
    mv latest_accounts/accounts_backup33.db latest_accounts/accounts_backup32.db
    mv latest_accounts/accounts_backup34.db latest_accounts/accounts_backup33.db
    mv latest_accounts/accounts_backup35.db latest_accounts/accounts_backup34.db
    mv latest_accounts/accounts_backup36.db latest_accounts/accounts_backup35.db
    mv latest_accounts/accounts_backup37.db latest_accounts/accounts_backup36.db
    mv latest_accounts/accounts_backup38.db latest_accounts/accounts_backup37.db
    cp ../accounts.db latest_accounts/accounts_backup38.db #newest

    sleep 5m
done
