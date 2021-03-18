/* -------------------------------------------------------------------------- */
/* STORING TEXT                                                               */
/* -------------------------------------------------------------------------- */

 CHAR -- is faster for fixed lenght text like -> Sex: M/F; Yes/No flags: Y/N etc

/* -------------------------------------------------------------------------- */
/* NUMBERS                                                                    */
/* -------------------------------------------------------------------------- */

INT(5) -- Whole numbers

DECIMAL(5,3) -- Where 5 is total number of digits before and after dec point
-- and 3 is number of digits after dec point -> have fixed-point type


/* FLOAT and DOUBLE -> have floating-point type will store larger number using less spcae */

FLOAT -- 4 bytes -- prssision issues ~7digits

DOUBLE -- 8 bytes -- prssision issues ~15digits






