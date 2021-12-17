package main

import (
    "fmt"
    "net/http"
)

func main() {
    http.HandleFunc("/", func(writer http.ResponseWriter, request *http.Request) {
        query := request.URL.Query()
        firstName := query["firstName"]
        lastName := query["lastName"]
        writer.Write([]byte(fmt.Sprintf("[Golang] Hello %s %s", firstName, lastName)))
    })

    err := http.ListenAndServe(":9001", nil)

    if err != nil {
        fmt.Println("error running server")
    }
}
