start_ngrok:
	ngrok http 9001

ngrok_server = 8b3b-2601-648-8801-a0b0-2cf1-3fb8-1fcf-dee7

test:
	echo "GET http://$(ngrok_server).ngrok.io?first_name=aa&last_name=bb" | vegeta attack -rate 1000 -duration 10s | vegeta report
