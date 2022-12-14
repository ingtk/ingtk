package main

import "fmt"

func main() {
	hoge()
}

func hoge() {
	defer (func() {
		err := recover()
		if err != nil {
			fmt.Println(err)
		}
	})()
	fmt.Println("hoge")
	fuga()
}

func fuga() {
	fmt.Println("fuga")
	piyo()
}

func piyo() {
	panic("error piyo")
	fmt.Println("piyo")
}
