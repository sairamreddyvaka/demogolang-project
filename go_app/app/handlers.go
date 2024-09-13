package app

import (
	"encoding/json"
	"net/http"
)

type Customer struct {
	Id    string `json: "id"`
	Name  string `json : "name"`
	Email string `json : "email"`
	Age   string `json : "age"`
}

func Hello(w http.ResponseWriter, r *http.Request) {

	w.Write([]byte("Hello, World!"))
}

func getAllcustomer(w http.ResponseWriter, r *http.Request) {
	customer := []Customer{
		{"1", "sai", "j@j.com", "29"},
		{"2", "ram", "j@j.com", "24"},
	}

	w.Header().Set("Content-Type", "application/json")
	w.WriteHeader(http.StatusOK)
	json.NewEncoder(w).Encode(customer)

}
