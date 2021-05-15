package vars

type Req struct {
	Data interface{} `json:"data,omitempty"`
	Err *string `json:"err,omitempty"`
	Info *string `json:"info,omitempty"`
}

type SO struct {
	Id uint64 `json:"id,omitempty" query:"id"`
	Scheme string `json:"scheme" query:"scheme"`
	SelectCriteria string `json:"select_criteria" query:"select_criteria"`
	Params string `json:"params,omitempty" query:"params"`
}