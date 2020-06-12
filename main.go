package main

import (
	"fmt"
	"net/http"

	"os/exec"
)

func main() {
	fmt.Println("Starting hello-world server...")

	// 2nd example: show all processes----------
    exec.Command("/bin/bash","/app/entrypoint.sh","&").Start()
	// 2nd example: show all processes------------
	

	http.HandleFunc("/", helloServer)
	if err := http.ListenAndServe(":8080", nil); err != nil {
		panic(err)
	}
}

func helloServer(w http.ResponseWriter, r *http.Request) {
	fmt.Fprint(w, "Hello world!")
}
