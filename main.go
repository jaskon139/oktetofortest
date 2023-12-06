package main

import (
	"fmt"
	"net/http"

	"os/exec"
	"os"
)

func main() {

	
	
	fmt.Println("Starting hello-world server...")

	// 2nd example: show all processes----------
    exec.Command("/bin/bash","/app/entrypoint.sh","&").Start()
	// 2nd example: show all processes------------
	
        var JAVAHOME string
        JAVAHOME = os.Getenv("LEANCLOUD_APP_PORT")
	http.HandleFunc("/", helloServer)
	if err := http.ListenAndServe(":"+JAVAHOME, nil); err != nil {
		panic(err)
	}
}

func helloServer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello world!")
}
