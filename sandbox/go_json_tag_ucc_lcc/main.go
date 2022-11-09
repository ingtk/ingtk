package main

import (
	"encoding/json"
	"fmt"
)

// json tag is declared with lcc
type Config struct {
	AccountID string `json:"accountId"`
	ProfileID string `json:"profileId"`
}

func main() {
	config := &Config{}
	// this json is ucc key
	var js = []byte(`{"AccountId": "a", "ProfileId": "b"}`)
	err := json.Unmarshal(js, config)
	fmt.Println(err)
	fmt.Println(config)
}
