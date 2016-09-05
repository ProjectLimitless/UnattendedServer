/*
	Defines functions for connecting to limitless
*/

/* Enums */

var limitless = new function() {
	
	this.socket = null;
	this.token = null;
	this.authed = false;
	this.dataHandler = null;
	this.stateHandler = null;
	/*
	 * Connect to the NodeJS/SocketIO limitless API
	 */
	this.connect = function (completed) {
		
		//socket = io('http://127.0.0.1:8002/client');
		socket = io('https://projectlimitless.local/client');
		
		socket.on('connecting', function(socket) {
			console.log('Connecting to Limitless');
		});
		socket.on('reconnecting', function () {
			console.log('Reconnecting to Limitless');
		});
		socket.on('connect', function (socket) {
			if (limitless.authed == false)
				limitless.authenticate(completed);
		});
		socket.on('disconnect', function (err) {
			limitless.authed = false;
			$token_hidden = $('#limitless_token');
			$token_hidden.remove();
			progressSetError('Disconnected');
		});
		socket.on('error', function (err) {
			limitless.authed = false;
			progressSetError('Failed to connect to limitless API');
		});
	}
	
	this.init = function(dataHandler, stateHandler, callback) {
		// Set callback for data handling
		limitless.dataHandler = dataHandler;
		limitless.stateHandler = stateHandler;
		limitless.token = $('#limitless_token').val();
		if (limitless.token == '')
		{
			callback(false);
		} 
		else 
		{
			callback(true);
		}
	}
	
	/*
	 * Authenticate, and then start processing info
	 */
	this.authenticate = function(completed) {
		
		socket.emit('auth', {'token': limitless.token, 'channel': limitless.token});
		socket.on('authres', function(authresult){
			if (authresult == 'success')
			{
				limitless.authed = true;
				completed(true);
				limitless.processMessages();
			}
			else
			{
				progressSetError('Unable to authenticate')
			}
		});
	};
	
	/*
	 * Accepts messages via socketio
	 */
	this.processMessages = function() {
		socket.on('data', function(data){
			limitless.dataHandler(data);
		});
		socket.on('state', function(statedata){
			limitless.stateHandler(statedata);
		});
	}
}



/*
 * Sets the text and style to error
 */
function progressSetError(text)
{
}

/*
 * Sets the text and style to connecting/reconnecting
 */
function progressSetConnecting(text)
{

}