start_ngrok:
	ngrok http 9001

ngrok_server = 470d-73-223-252-60

test:
	echo "GET http://$(ngrok_server).ngrok.io?first_name=aa&last_name=bb" | vegeta attack -rate 1000 -duration 10s | vegeta report

test-local:
	echo "GET http://127.0.0.1:9001?first_name=aa&last_name=bb" | vegeta -cpus 1 attack -rate 5000 -duration 30s | vegeta report
