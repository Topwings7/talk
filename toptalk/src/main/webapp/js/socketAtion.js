	setTimeout(() => {
		openSocket();
	}, 500);
	setInterval(() => {
		clearText();
	}, 20000); 
	setInterval(() => {
	messages.scrollTop = messages.scrollHeight;
	}, 500);

 	var ws;
	var messages = document.getElementById("messages");
	function openSocket() {
		if (ws !== undefined && ws.readyState !== WebSocket.CLOSED) {
			writeResponse("WebSocket is already opened.");
			return;
		}
		ws = new WebSocket("ws://localhost:8080/top/echo");
		ws.onopen = function(event) {
			if (event.data === undefined) {
				return;
			}
			writeResponse(event.data);
		};
		ws.onmessage = function(event) {
			console.log('writeResponse');
			console.log(event.data)
			writeResponse(event.data);
		};
		ws.onclose = function(event) {
			writeResponse("대화 종료");
		}
	}
	
	function send() {
		var text = document.getElementById("messageinput").value + "," + document.getElementById("sender").value;
		ws.send(text);
		console.dir(text);
		text = "";
	 	var value = document.getElementById("messageinput");
		value.value = "";
	}
	
	function closeSocket() {
		ws.close();
	}
	
	function writeResponse(text) {
		messages.innerHTML += "<br/>" + text;
	}
	
	function clearText() {
		console.dir(messages);
		messages.innerText = "";
	}
	
	function out() {
		ws.close();
		history.go(-1);
	}