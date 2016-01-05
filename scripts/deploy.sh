#!/bin/bash

rsync -r --del ./static_generated nasm:/var/www/afaa.nasm.pw

curl -X POST \
--data-urlencode 'payload={"text": "http://afaa.nasm.pw has been updated with the latest changes.", "channel": "#code", "username": "deploy-bot", "icon_emoji": ":shipit:"}' \
https://hooks.slack.com/services/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

curl -d '{"color": "green", "message": "(shipit) http://afaa.nasm.pw has been updated with the latest changes.", "notify": false, "message_format": "text"}' \
-H 'Content-Type: application/json' \
https://hc.ascendlearning.com/v2/room/308/notification?auth_token=hUgcWvUfoolP7lK4j32ynCuYggepnbR1ebgxjm00
