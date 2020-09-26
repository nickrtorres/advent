structure Assert = struct
    exception AssertionFailed
    fun eq (left:''a,right:''a) =
        if left <> right then raise AssertionFailed else ();
    fun true (expr:bool) =
        if not(expr) then raise AssertionFailed else ();
    fun false (expr:bool) =
        if expr then raise AssertionFailed else ();
end
