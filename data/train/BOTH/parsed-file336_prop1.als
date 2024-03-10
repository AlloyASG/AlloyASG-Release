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
pred prop1[] {
(all s: (one Signal) {
((s !in Green) until (some s: (one Signal) {
(s in Green)
}))
})
}
pred prop1C[] {
(no Green)
}
pred overconstrained[] {
((prop1C[]) && (!(prop1[])))
}
pred underconstrained[] {
((!(prop1C[])) && (prop1[]))
}
pred both[] {
((prop1C[]) && (prop1[]))
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
