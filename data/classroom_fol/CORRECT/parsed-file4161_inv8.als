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
pred inv8[] {
(all x: (one Teacher),y,z: (one Class) {
((((x->y) in Teaches) && ((x->z) in Teaches)) => (y = z))
})
}
pred inv8C[] {
(all t: (one Teacher) {
(lone (t.Teaches))
})
}
pred overconstrained[] {
((inv8C[]) && (!(inv8[])))
}
pred underconstrained[] {
((!(inv8C[])) && (inv8[]))
}
pred both[] {
((inv8C[]) && (inv8[]))
}



run overconstrained
run underconstrained
run both
