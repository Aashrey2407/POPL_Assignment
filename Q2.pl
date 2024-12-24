operator('+').
operator('-').
operator('*').
operator('/').

compute('+', V1, V2, V) :- V is V1 + V2.
compute('-', V1, V2, V) :- V is V1 - V2.
compute('*', V1, V2, V) :- V is V1 * V2.
compute('/', V1, V2, V) :- 
    V2 =\= 0,
    0 is V1 mod V2,
    V is V1 // V2.

split_at_equals(List, Left, Right) :- append(Left, Right, List), Left \= [], Right \= [].

build_expr([N], N, N).
build_expr(Numbers, Expr, Val) :-
    append(Left, Right, Numbers),
    Left \= [],
    Right \= [],
    build_expr(Left, Expr1, Val1),
    build_expr(Right, Expr2, Val2),
    operator(Op),
    compute(Op, Val1, Val2, Val),
    Expr =.. [Op, Expr1, Expr2].

generate_equation(NumberList, Equation) :- 
    split_at_equals(NumberList, LeftNumbers, RightNumbers),
    build_expr(LeftNumbers, LeftExpr, LeftVal),
    build_expr(RightNumbers, RightExpr, RightVal),
    LeftVal =:= RightVal,
    term_to_atom(LeftExpr, LeftStr),
    term_to_atom(RightExpr, RightStr),
    atom_concat(LeftStr, '=', Temp),
    atom_concat(Temp, RightStr, Equation).

