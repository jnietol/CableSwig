;; The SWIG modules have "passive" Linkage, i.e., they don't generate
;; Guile modules (namespaces) but simply put all the bindings into the
;; current module.  That's enough for such a simple test.
(dynamic-call "scm_init_contract_module" (dynamic-link "./libcontract.so"))
(load "testsuite.scm")

(test-preassert 1 2)
(expect-throw 'swig-contract-assertion-failed
	      (test-preassert -1 2))
(test-postassert 3)
(expect-throw 'swig-contract-assertion-failed
	      (test-postassert -3))
(test-prepost 2 3)
(test-prepost 5 -4)
(expect-throw 'swig-contract-assertion-failed
	      (test-prepost -3 4))
(expect-throw 'swig-contract-assertion-failed
	      (test-prepost 4 -10))

(quit)
