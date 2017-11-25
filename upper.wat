;; upper.wat
(module
  (memory (export "memory") 10 10)
  (func (export "upper") (param $ptr i32) (param $ptr_end i32)
    (block $end_loop
      (loop $start_loop
        (br_if $end_loop (i32.eq (get_local $ptr) (get_local $ptr_end)))
        (i32.store8
          (get_local $ptr)
          (i32.sub (i32.load8_u (get_local $ptr)) (i32.const 32))
        )
        (set_local $ptr (i32.add (get_local $ptr) (i32.const 1)))
        (br $start_loop)
      )
    )
  )
)