
OscIn oin;
6449 => oin.port;
OscMsg msg;
oin.addAddress( "/foo/notes" );

while(true){
    oin => now;
    while(oin.recv(msg)){
        <<<"We have recieved!">>>;
    }
}