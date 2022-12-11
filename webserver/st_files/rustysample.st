VAR_GLOBAL
    input AT %IX0.0: BOOL; (* Comment *)
    output AT %QX0.0: BOOL; (* Comment *)
END_VAR

PROGRAM program0
    output := input;
END_PROGRAM

FUNCTION config_run__ : ULINT
  VAR_INPUT
    tick: ULINT; (* Comment *)
  END_VAR
  program0();
END_FUNCTION

FUNCTION config_init__ : ULINT
  config_init__ := 0;
END_FUNCTION
