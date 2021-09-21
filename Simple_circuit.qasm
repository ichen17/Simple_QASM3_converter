OPENQASM 3.0;
include "stdgates.inc";

//const b=32;

qubit[3] q;
bit[3] c;

reset q;

x q;

swap q[0],q[1];
rz(1.57) q[0];

measure q[0] -> c[0];
measure q[1] -> c[1];