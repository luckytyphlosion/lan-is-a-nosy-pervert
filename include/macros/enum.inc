
	.definelabel __enum_inc_amount, 1
	.definelabel __subenum_inc_amount, 1

	.macro subenum_inc, x
	.definelabel x, x + __subenum_inc_amount
	.endmacro

	.macro enum_start, x, inc_amount
	.definelabel __enum__, x
	.definelabel __enum_inc_amount, inc_amount
	.endmacro

	.macro enum, constant
	.definelabel constant, __enum__
	.definelabel __enum__, __enum__ + __enum_inc_amount
	.endmacro

	.macro enum_skip, skip_amount
	.definelabel __enum__, __enum__ + skip_amount
	.endmacro

	.macro subenum_start, x, inc_amount
	.definelabel __subenum__, x
	.definelabel __subenum_inc_amount, inc_amount
	.endmacro

	.macro subenum, constant
	.definelabel constant, __subenum__
	.definelabel __subenum__, __subenum__ + __subenum_inc_amount
	.endmacro

	.macro subenum_skip, skip_amount
	.definelabel __subenum__, __subenum__ + skip_amount
	.endmacro
