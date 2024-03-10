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
(all x: (one Class),y: (one Student) {
((some z: (one Group) {
((x->(y->z)) in Groups)
}) && (some v: (one Teacher) {
(((v->x) in Teaches) => ((v->y) in Tutors))
}))
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
