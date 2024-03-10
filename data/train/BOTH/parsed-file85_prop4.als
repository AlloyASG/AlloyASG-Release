module unknown
open util/integer [] as integer
sig Track {
prox: (set Track),
signal: (lone Signal)
}
sig Junction extends Track {}
sig Entry in Track {}
sig Exit in Track {}
sig Signal {}
var sig Green in Signal {}
sig Train {
var pos: (lone Track)
}
pred prop4[] {
(all disj s1,s2: (one Signal) {
(always ((s1.pos) != (s2.pos)))
})
}
pred prop4C[] {
(always (all t: (one Track) {
(lone (pos.t))
}))
}
pred overconstrained[] {
((prop4C[]) && (!(prop4[])))
}
pred underconstrained[] {
((!(prop4C[])) && (prop4[]))
}
pred both[] {
((prop4C[]) && (prop4[]))
}

fact Layout {
((all t: (one Track) {
((t !in Junction) <=> ((lone (t.prox)) && (lone (prox.t))))
}) && (no t: (one Track) {
(t in (t.(^prox)))
}) && (all s: (one Signal) {
(one (signal.s))
}) && (all j: (one Junction),t: (one (prox.j)) {
(some (t.signal))
}) && (all t: (one Track) {
((t in Entry) <=> (no (prox.t)))
}) && (all t: (one Track) {
((t in Exit) <=> (no (t.prox)))
}))
}

run overconstrained
run underconstrained
run both
