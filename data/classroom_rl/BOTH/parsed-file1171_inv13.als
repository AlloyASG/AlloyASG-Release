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
pred inv13[] {
(all s: (one Student),t: (one Teacher) {
((s !in ((Person.Tutors).(^Tutors))) && (t !in ((Person.(~Tutors)).(^(~Tutors)))))
})
}
pred inv13C[] {
(((Tutors.Person) in Teacher) && ((Person.Tutors) in Student))
}
pred overconstrained[] {
((inv13C[]) && (!(inv13[])))
}
pred underconstrained[] {
((!(inv13C[])) && (inv13[]))
}
pred both[] {
((inv13C[]) && (inv13[]))
}



run overconstrained
run underconstrained
run both
