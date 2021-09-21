# Simple_QASM3_converter

This Simple_QASM3_converter can support QASM 3.0 code with stdgates.inc to create a simple circuit in qiskit

  However, it just supports gates such  X, Y, Z, RX, RY, RZ, H, S, S†, T, T†, CX, CCX, SWAP & CSWAP.

  It doesn't support custom gate.

  The for loop and if command in Qasm3.0 cannot be converted in this function.

  Also pi variable in QASM3.0 cannot work

  Basic supporting form:

  qasm_1 = '''/* This a QASM 3.0 Code.\n It can be converted into qiskit using this class*/ 
  OPENQASM 3.0;
  include "stdgates.inc";
  qubit[3] q;
  qubit[1] a;
  bit[3] c;
  bit ca;
  x q;
  s q;
  y q[0];
  cx q[0] q[2];// cnot gate 
  swap q[0] q[1];
  ccx q[0] q[1] q[2];// toffoli gate 
  ry(1.5) q; 
  cswap q[0] q[1] q[2];
  rx(1.3) a; 
  cx a q[0];  
  measure q -> c; 
  ca = measure a;'''

  Or, you can input simple QASM3.0 file.
  
  
