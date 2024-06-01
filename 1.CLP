(defglobal ?*x* = 1)

(defrule data-input
  (initial-fact)
=>
  (printout t crlf "Write in format: [Status] [who] [for whom]" crlf)
  (while (= ?*x* 1)
  (bind ?input (explode$ (readline)))
  (if (eq (nth$ 1 ?input) stop) 
   then 
       (halt)
	   (bind ?*x* 0)
   else
       (assert (data (nth$ 1 ?input) (nth$ 2 ?input)(nth$ 3 ?input)))))
  )
  
 (defrule r1
 (data wife ?x ?y)
 =>
 (printout t crlf ?y " is husband of " ?x crlf)
 (assert(data husband ?y ?x)))
 
 (defrule r2
 (data husband ?x ?y)
 =>
 (printout t crlf ?y " is wife of " ?x crlf)
 (assert(data wife ?y ?x)))

 (defrule r3
 (data brother/sister ?x ?y)
 =>
 (printout t crlf ?y " is brother/sister of " ?x crlf)
 (assert(data brother/sister ?y ?x)))

 (defrule r4
 (data brother/sister ?x ?y)
 (data brother/sister ?x ?z)
 (test(neq ?z ?y))
 =>
 (printout t crlf ?y " is  brother/sister of " ?z crlf)
 (assert(data brother/sister ?y ?z)))
 
 (defrule r36
 (data father ?x ?y)
 (data father ?x ?z)
 (test(neq ?y ?z))
 =>
 (printout t crlf ?z " is brother/sister of " ?y crlf)
 (assert(data brother/sister ?z ?y)))
 
 (defrule r37
 (data mother ?x ?y)
 (data mother ?x ?z)
 (test(neq ?y ?z))
 =>
 (printout t crlf ?z " is brother/sister of " ?y crlf)
 (assert(data brother/sister ?z ?y)))
 
 (defrule r0
 (data father ?x ?y)
 (data mother ?z ?y)
=>
 (printout t crlf ?z " is wife of " ?x crlf)
 (assert(data wife ?z ?x)))

 (defrule r5
 (data mother ?x ?y)
 (data wife ?x ?z)
 =>
 (printout t crlf ?z " is  father of " ?y crlf)
 (assert(data father ?z ?y)))
 
 (defrule r6
 (data father ?x ?y)
 (data husband ?x ?z)
 =>
 (printout t crlf ?z " is  mother of " ?y crlf)
 (assert(data mother ?z ?y)))

 (defrule r7
 (data mother ?x ?y)
 (data brother/sister ?y ?z)
 =>
 (printout t crlf ?x " is mother of " ?z crlf)
 (assert(data mother ?x ?z)))

 (defrule r8
 (data father ?x ?y)
 (data brother/sister ?y ?z)
 =>
 (printout t crlf ?x " is father of " ?z crlf)
 (assert(data father ?x ?z)))

 (defrule r9
 (data mother ?x ?y)
 (data brother/sister ?x ?z)
 =>
 (printout t crlf ?z " is uncle/aunt of " ?y crlf)
 (assert(data uncle/aunt ?z ?y)))

 (defrule r10
 (data father ?x ?y)
 (data brother/sister ?x ?z)
 =>
 (printout t crlf ?z " is uncle/aunt of " ?y crlf)
 (assert(data uncle/aunt ?z ?y)))
 
 (defrule r11
 (data uncle/aunt ?x ?y)
 (data mother ?x ?z)
 =>
 (printout t crlf ?y " is cousin of " ?z crlf)
 (assert(data cousin ?y ?z)))

 (defrule r12
 (data uncle/aunt ?x ?y)
 (data father ?x ?z)
 =>
 (printout t crlf ?z " is cousin of " ?y crlf)
 (assert(data cousin ?y ?z)))

 (defrule r13
 (data cousin ?x ?y)
 =>
 (printout t crlf ?y " is cousin of " ?x crlf)
 (assert(data cousin ?y ?x)))

 (defrule r14
 (data mother ?x ?y)
 (data mother ?z ?x)
 =>
 (printout t crlf ?z " is grandmother of " ?y crlf)
 (assert(data grandmother ?z  ?y)))

 (defrule r15
 (data father ?x ?y)
 (data mother ?z ?x)
 =>
 (printout t crlf ?z " is grandmother of " ?y crlf)
 (assert(data grandmother ?z ?y)))

 (defrule r16
 (data mother ?x ?y)
 (data father ?z ?x)
 =>
 (printout t crlf ?z " is grandfather  of " ?y crlf)
 (assert(data grandfather  ?z  ?y)))

 (defrule r17
 (data father ?x ?y)
 (data father ?z ?x)
 =>
 (printout t crlf ?z " is grandfather of " ?y crlf)
 (assert(data grandfather ?z ?y)))

 (defrule r18
 (data husband ?x ?y)
 (data mother ?z ?x)
 =>
 (printout t crlf ?z " is svekrov of " ?y crlf)
 (assert(data svekrov ?z ?y)))

 (defrule r19
 (data husband ?x ?y)
 (data father ?z ?x)
 =>
 (printout t crlf ?z " is svekor of " ?y crlf)
 (assert(data svekor ?z ?y)))

 (defrule r20
 (data wife ?x ?y)
 (data mother ?z ?x)
 =>
 (printout t crlf ?z " is teshcha of " ?y crlf)
 (assert(data teshcha ?z ?y)))

 (defrule r21
 (data wife ?x ?y)
 (data father ?z ?x)
 =>
 (printout t crlf ?z " is test of " ?y crlf)
 (assert(data test ?z ?y)))
 
 (defrule r22
 (data husband ?x ?y)
 (data brother/sister ?x ?z)
 =>
 (printout t crlf ?z " is brother/sister-in-law of " ?y crlf)
 (assert(data brother/sister-in-law ?z ?y)))

 (defrule r23
 (data wife ?x ?y)
 (data brother/sister ?x ?z)
 =>
 (printout t crlf ?z " is brother/sister-in-law of " ?y crlf)
 (assert(data brother/sister-in-law ?z ?y)))
 
 (defrule r24
 (data mother ?x ?y)
 (data grandmother ?y ?z)
=>
 (printout t crlf ?x " is great-grandmother 1 of " ?z crlf)
 (assert(data great-grandmother ?x ?z 1)))

 (defrule r25
 (data mother ?x ?y)
 (data great-grandmother ?y ?z ?st)
=>
 (printout t crlf ?x " is great-grandmother " ?st " of " ?z crlf)
 (assert(data great-grandmother ?x ?z (+ 1 ?st))))
 
 (defrule r26
(data father ?x ?y)
(data grandmother ?y ?z)
=>
(printout t crlf ?x " is great-grandfather 1 of " ?z crlf)
(assert(data great-grandfather ?x ?z 1)))

(defrule r27
(data father ?x ?y)
(data great-grandmother ?y ?z ?st)
=>
(printout t crlf ?x " is great-grandfather " (+ 1 ?st) " of " ?z crlf)
(assert(data great-grandfather ?x ?z (+ 1 ?st))))

(defrule r28
(data mother ?x ?y)
(data grandfather ?y ?z)
=>
(printout t crlf ?x " is great-grandmother  1 of " ?z crlf)
(assert(data great-grandmother  ?x ?z 1)))

(defrule r29
(data mother ?x ?y)
(data great-grandfather ?y ?z ?st)
=>
(printout t crlf ?x " is great-grandmother " (+ 1 ?st)" of " ?z crlf)
(assert(data great-grandmother ?x ?z (+ 1 ?st))))

(defrule r30
(data father ?x ?y)
(data grandfather ?y ?z)
=>
(printout t crlf ?x " is great-grandfather 1 of " ?z crlf)
(assert(data great-grandfather ?x ?z 1)))

(defrule r31
(data father ?x ?y)
(data great-grandfather ?y ?z ?st)
=>
(printout t crlf ?x " is great-grandfather " (+ 1 ?st) " of " ?z crlf)
(assert(data great-grandfather ?x ?z (+ 1 ?st))))

(defrule r32
(data mother ?x ?y)
(data cousin ?x ?z)
=>
(printout t crlf ?z " is uncle/aunt 2 of " ?y crlf)
(assert(data uncle/aunt ?z ?y 2)))

(defrule r33
(data uncle/aunt ?x ?y ?st)
(data cousin ?x ?z)
(not(exists(or(data mother ?z ?y)(data father ?z ?y))))
(not(exists(data uncle/aunt ?z ?y $?)))
=>
(printout t crlf ?z " is uncle/aunt " (+ 1 ?st) " of " ?y crlf)
(assert(data uncle/aunt ?z ?y (+ 1 ?st))))

(defrule r34
(data father ?x ?y)
(data cousin ?x ?z)
=>
(printout t crlf ?z " is uncle/aunt 2 of " ?y crlf)
(assert(data uncle/aunt ?z ?y 2)))

(defrule r35
(data brother/sister ?x ?y)
(data cousin ?x ?z)
=>
(printout t crlf ?y " is cousin of " ?z crlf)
(assert(data cousin ?y ?z)))




