package handlers

import (
	"github.com/labstack/echo/v4"
	"net/http"
	"rbd/src/domain"
	"rbd/src/vars"
)

func NewString(s string) *string {
	return &s
}

func PostSO(ctx echo.Context) (err error) {
	so := new(vars.SO)
	if err = ctx.Bind(so); err != nil {
		return
	}

	if err = domain.AddSO(ctx, *so); err != nil {
		return
	}

	return ctx.JSON(http.StatusOK,  vars.Req{
		Data: nil,
		Err: nil,
		Info: NewString("Ok"),
	})
}
