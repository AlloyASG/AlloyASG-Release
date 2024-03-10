module unknown
open util/integer [] as integer
abstract sig Source {}
sig User extends Source {
profile: (set Work),
visible: (set Work)
}
sig Institution extends Source {}
sig Id {}
sig Work {
ids: (some Id),
source: (one Source)
}
pred Inv3[] {
(all u: (one User) {
(all id1,id2: (one Id) {
((id1 in ((u.profile).ids)) => (id2 !in ((u.profile).ids)))
})
})
}
pred Inv3C[] {
(all w1,w2: (one Work),u: (one User) {
(((w1 != w2) && ((w1 + w2) in (u.profile)) && ((w1.source) = (w2.source))) => (no ((w1.ids) & (w2.ids))))
})
}
pred overconstrained[] {
((Inv3C[]) && (!(Inv3[])))
}
pred underconstrained[] {
((!(Inv3C[])) && (Inv3[]))
}
pred both[] {
((Inv3C[]) && (Inv3[]))
}



run overconstrained
run underconstrained
run both
