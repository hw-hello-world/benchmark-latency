start_ngrok:
	ngrok http 9001

ngrok_server=http://98ef-2601-648-8801-a0b0-2cf1-3fb8-1fcf-dee7.ngrok.io
test:
	echo "GET $(ngrok_server)" | vegeta attack -rate 1000 -duration 10s | vegeta report
