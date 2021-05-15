package domain

import (
	"github.com/labstack/echo/v4"
	"rbd/src/vars"
	"rbd/src/storage"
)

func AddSO(ctx echo.Context, so vars.SO) (err error) {
	if err = storage.InsertSO(ctx, so); err != nil {
		return
	}

	return nil
}
