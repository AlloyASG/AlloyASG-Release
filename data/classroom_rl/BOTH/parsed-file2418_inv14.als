module unknown
open util/integer [] as integer
sig Person {
Tutors: (set Person),
Teaches: (set Class)
}
sig Group {}
sig Class {
Groups: (Person->Group)
}
sig Teacher in Person {}
sig Student in Person {}
pred inv14[] {
(all s: (one Person),c: (one Class) {
(some t: (one Person) {
(((t->c) in Teaches) => (some g: (one Group) {
((c->(s->g)) in Groups)
}))
})
})
}
pred inv14C[] {
(all s: (one Person),c: (one Class),t: (one Person),g: (one Group) {
((((c->(s->g)) in Groups) && ((t->c) in Teaches)) => ((t->s) in Tutors))
})
}
pred overconstrained[] {
((inv14C[]) && (!(inv14[])))
}
pred underconstrained[] {
((!(inv14C[])) && (inv14[]))
}
pred both[] {
((inv14C[]) && (inv14[]))
}



run overconstrained
run underconstrained
run both
