#!/bin/bash
cd "$(dirname "$0")"
PORT=8765

if curl -sf -o /dev/null --max-time 1 "http://127.0.0.1:${PORT}/"; then
  open "http://127.0.0.1:${PORT}/"
  exit 0
fi

python3 -m http.server "$PORT" --bind 127.0.0.1 &
SERVER=$!
sleep 0.4
open "http://127.0.0.1:${PORT}/"

echo ""
echo "은하 돌잔치 대본이 열렸습니다."
echo "music 폴더에 넣은 곡이 순서에 연결됩니다."
echo "파티가 끝나면 이 창을 닫으세요."
echo ""
wait "$SERVER"
