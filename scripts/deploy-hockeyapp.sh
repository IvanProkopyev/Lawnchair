#!/usr/bin/env sh

./scripts/deploy-telegram.sh

BRANCH=$0

curl \
    -F status="2" \
    -F notify="1" \
    -F tags="$BRANCH" \
    -F dsym=@"proguard-$TRAVIS_BUILD_NUMBER.txt" \
    -F ipa=@"Lawnchair-$TRAVIS_BUILD_NUMBER.apk" \
    -H "X-HockeyAppToken: $HOCKEYAPP_TOKEN" \
    https://rink.hockeyapp.net/api/2/apps/$HOCKEYAPP_APPID/app_versions/upload