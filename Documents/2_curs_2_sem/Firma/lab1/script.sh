#!/bin/bash

SERVER_URL="http://localhost:8080/"
MAILGUN_API_KEY="api:b739a7da84b53ff1d1056053e0e8e0a8-6b161b0a-60620b4a"
MAILGUN_URL="https://api.mailgun.net/v3/sandboxa073e67cc09c41569b484a6cdb3b1dc4.mailgun.org/messages"

function check_status {
  status=$(curl --write-out %{http_code} --silent --output /dev/null "$SERVER_URL")
  echo "$status"

  if [[ $status != 2* && $status != 3* ]]; then
    message="Server returned status $status at $(date '+%Y-%m-%d %H:%M:%S')"
    curl -s --user "$MAILGUN_API_KEY" "$MAILGUN_URL" \
      -F from='Mailgun Sandbox <postmaster@sandboxa073e67cc09c41569b484a6cdb3b1dc4.mailgun.org>' \
      -F to=khrystynakohut16@gmail.com \
      -F subject='Server Error' \
      -F text="Server returned status $status at $(date '+%Y-%m-%d %H:%M:%S')"
  fi
}

while true; do
  check_status
  sleep 30
done