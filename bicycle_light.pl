0.6::str(dry).
0.3::str(wet). 
0.1::str(snow_covered).

0.8::flw(false).
0.2::flw(true).

0.95::b(true).
0.05::b(false). 

0.95::k(true).
0.05::k(false).

0.1::r(true) :- str(dry), flw(false).
0.3::r(true) :- str(dry), flw(true).
0.4::r(true) :- str(wet), flw(false). 
0.7::r(true) :- str(wet), flw(true).
0.8::r(true) :- str(snow_covered), flw(false).
0.9::r(true) :- str(snow_covered), flw(true).

0.2::v(true) :- r(true).
0.7::v(true) :- \+r(true).

0.99::li(true) :- v(true), b(true), k(true).
0.01::li(true) :- v(true), (b(false); k(false)). 
0.3::li(true) :- \+v(true), b(true), k(true).
0.005::li(true) :- \+v(true), (b(false); k(false)).

evidence(str(snow_covered)).
query(v(true)).