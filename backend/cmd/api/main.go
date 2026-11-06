package main

import (
	"fmt"
	"net/http"

	"github.com/go-chi/chi"
	"github.com/go-chi/chi/middleware"
)

func main() {

	r := chi.NewRouter()
	r.Use(middleware.Logger)

	r.Get("/health", basicHandler)

	srv := &http.Server{
		Addr:    ":3000",
		Handler: r,
	}

	err := srv.ListenAndServe()
	if err != nil {
		fmt.Println("failed to listen to server", err)
	}
}

func basicHandler(w http.ResponseWriter, r *http.Request) {

	w.Write([]byte("Hello, world!"))

}
