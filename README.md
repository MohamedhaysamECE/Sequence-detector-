# Sequence-detector
 A sequence detector is a sequential state machine used to detect consecutive bits in a binary string.
 Both Mealy and Moore machines can be used to design sequence detector logic. 
 Further, these machines are classified as
 
1-Overlapping sequence detector : Final bits of the sequence can be the start of another sequence. Thus, it allows overlap.

2-Non-overlapping sequence detector : Once sequence detection is completed, another sequence detection can be started without any overlap.
 
 ## Finite State Machine
 For combinational designs, the output value completely depends on the present value of the inputs and for sequential designs, output value not only depends on present input but also depends on its previously stored value i.e. past behavior of the design. These sequential designs are formally knowns as finite-state machines that have a fixed number of states. In sequential designs or FSM, a clock signal serves the purpose to control FSM operation. There are two ways to design FSMs.

1-Mealy Machine

2-Moore Machine

## Difference between Mealy and Moore Machines

### Moore Machine

1-Output depends on the present state and current input

2-Requires fewer states to design

3-Reacts faster to the input and requires less hardware implementation

4-Difficult to design

### Moore Machine

1-Output only depends on the present state. It is independent of current input

2-Requires more states to design

3-More logic is required to decode the output.

4-Easy to design

## Our design with overlap
