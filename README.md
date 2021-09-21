# Simple_QASM3_converter

This Simple_QASM3_converter can support QASM 3.0 code with stdgates.inc to create a simple circuit in qiskit

  However, it just supports gates such  X, Y, Z, RX, RY, RZ, H, S, S†, T, T†, CX, CCX, SWAP & CSWAP.

  It doesn't support custom gate.

  The for loop and if command in Qasm3.0 cannot be converted in this function.

  Also, pi variable in QASM3.0 cannot work and other declarations is not supported as well.

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
  
  
  # Qasm3_2_qiskit_circuit
  
  The main function to qasm into qiskit circuit. The function will check line by line whether the variable is defined already and whether the header and library are included.
  
  Also, self.QASM_operation stores the gate operations on specific qubit which is defined already.
  
  self.head : Make sure header is declared (if not declared, it is just None.)

  self.Total_line : The total line of code

  self.qr :  Make sure whether quantum bit is declared or not (if not declared, it is just None.)

  self.qr_dict : To save varibles of quantum bit  (if not declared, it is just None.)

  self.cr : None # Make sure whether quantum bit is declared or not

  self.cr_dict : To save varibles of classical bit 

  self.lib: None  Make sure library (if not included, it is just None.)

  self.non_lib_operation: reset # the operation already in Qasm3.0

  self.measurement: measure  (measurement operation)

  self.QASM_operation: To store gate operations on each qubit as list, also the measurement.

  self.lib_no_param_single_qubit:  The single qubit gates w/o parameter (if "stdgates.inc" is included, it will be ['x','y','z','h','s','sdg','t','tdg'])

  self.lib_no_param_two_qubit: Two qubit gates w/o parameter (if "stdgates.inc" is included, it will be ['cx','swap'])

  self.lib_no_param_three_qubit: Three qubit gates w/o parameter (if "stdgates.inc" is included, it will be ['cswap','ccx']])

  self.lib_param_sing_qubit: Single qubit w/ one parameter (if "stdgates.inc" is included, it will be ['rx','ry','rz'])
  
  Finally, the function sends self.QASM_operation to the function operation_to_circuit
  
  # operation_to_circuit
   
  It is used to transfer the operation into Qiskit circuit.

  Input: the operation made by Qasm3_2_qiskit_circuit function

  Output: The qiskit circuit

  qr_key_list: Qubit variable bits list

  cr_key_list: bit variable bits list

  quantum_reg_list: To record quantum registers as list

  classical_reg_list: To record quantum registers as list

  var_to_list_index_q: To record which variable correspond to which quantum register

  var_to_list_index_c: To record which variable correspond to which classical register
  
  # Inverse_circuit
  
  Input: circuit without custom gate but with some basic gates

  Output: Inverse circuit  

  This function can found out the unitary of circuit using unitrary property (ABC)^{\dagger}=C^{\dagger}B^{\dagger}A^{\dagger}
  
  where ABC is the gate X, Y, Z, RX, RY, RZ, H, S, S†, T, T†, CX, CCX, SWAP & CSWAP.
  
  This circuit reverse the gate operation order of original circuit and find out individual gate's conjugate transpose.
  
  If the gate is Hermitian_gate (U^dagger=U) [X,Y,Z,H,CX,CCX,Swap,CSwap], we can just apply the same gate.
  
  If the gate is Non_Hermitian_gate (U^dagger != U) [S,Sdg,T,Tdg], we can find its conjugate transpose.
  
  If the gate isRotation gate [RX,RY,RZ], we can flip the sign of rotation gate
  
  If the measurement is not in the end of circuit (for instance, q0-H-Measure-X), the circuit is not an unitary. This function cannot work.

  
  
  
  
  
