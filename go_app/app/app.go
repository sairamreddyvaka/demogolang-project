package app

import (
	"log"
	"net/http"

	"github.com/gorilla/mux"
)

func Start() {

	mux := mux.NewRouter()
	mux.HandleFunc("/customer", getAllcustomer)
	mux.HandleFunc("/greet", Hello)
	log.Fatal(http.ListenAndServe(":8080", mux))

}
