#!/bin/bash

rsync -r --del ./static_generated nasm:/var/www/afaa.nasm.pw

curl -X POST \
--data-urlencode 'payload={"text": "http://afaa.nasm.pw has been deployed.", "channel": "#code", "username": "deploy-bot", "icon_emoji": ":shipit:"}' \
https://hooks.slack.com/services/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
