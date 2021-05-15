package main

import (
	"github.com/labstack/echo/v4"
	"net/http"
	"rbd/src/handlers"
	"rbd/src/storage"
)

func main() {
	e := echo.New()

	b, err := storage.CreateConn()
	if err != nil {
		e.Logger.Fatal(err)
	}

	e.GET("/", func(c echo.Context) error {
		return c.String(http.StatusOK, handlers.Func())
	})

	e.Logger.Fatal(e.Start(":1323"))
}