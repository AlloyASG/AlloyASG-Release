module unknown
open util/integer [] as integer
sig State {
trans: (Event->State)
}
sig Init in State {}
sig Event {}
pred inv5[] {
(all s1,s2: (one State),e: (one Event) {
((e.(s1.trans)) = (e.(s2.trans)))
})
}
pred inv5C[] {
(all s: (one State),s1: (one State) {
(((s.trans).State) = ((s1.trans).State))
})
}
pred overconstrained[] {
((inv5C[]) && (!(inv5[])))
}
pred underconstrained[] {
((!(inv5C[])) && (inv5[]))
}
pred both[] {
((inv5C[]) && (inv5[]))
}



run overconstrained
run underconstrained
run both
