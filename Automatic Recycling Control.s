settings:
alias recycler d0
alias centrafuge d1
alias arcfurnace d2
alias arcvent d3
alias diode d4
define chutebin -850484480
s arcvent Mode 1


checkon:
l r1 centrafuge Reagents
bgt r1 30 release
ls r1 arcfurnace 0 Occupied
bnez r1 run
ls r1 centrafuge 0 Quantity
bnez r1 run
lb r14 chutebin On Maximum
beqz r14 stop
j run

release:
s centrafuge Open 1
s centrafuge On 1
sleep 15
s centrafuge Open 0
j run

stop:
s recycler On 0
s centrafuge On 0
s arcfurnace On 0
s arcvent On 0
s diode On 0
j checkon

run:
s recycler On 1
s centrafuge On 1
s arcfurnace On 1
s arcvent On 1
s arcvent Mode 1
s diode On 1

ls r1 arcfurnace 0 Occupied
breqz r1 2
yield
ls r2 arcfurnace 0 Occupied
ls r3 arcfurnace 1 Occupied
ble r2 r3 checkon
ls r4 arcfurnace 0 Quantity
s arcfurnace Activate 1
yield
l r5 arcfurnace Reagents
div r6 r5 r4
s diode Setting r6
l r7 arcfurnace Activate
brnez r7 -5
j checkon