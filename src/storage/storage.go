package storage

import (
	"github.com/jackc/pgx"
	"github.com/labstack/echo/v4"
	"rbd/src/vars"
)

var conn *pgx.Conn

func CreateConn() (err error){
	config := pgx.ConnConfig{
		Host: "localhost",
		Port: 5432,
		Database: "postgres",
		User: "postgres",
		Password: "postgres",
	}

	if conn, err = pgx.Connect(config); err != nil {
		return err
	}

	return nil
}

func InsertSO(ctx echo.Context, so vars.SO) (err error) {
	_ := conn.QueryRow(vars.InserIntoSO, so.Scheme, so.SelectCriteria, so.Params)


	return nil
}