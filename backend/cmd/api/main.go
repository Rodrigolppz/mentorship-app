package main

import "net/http"

func main() {
	app := &application{}

	http.ListenAndServe(":3333", app.mount())
}
