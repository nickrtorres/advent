use "../lib/common.sml"; (* readIntoList *)
use "../lib/assert.sml"; (* Assert.* *)

fun getPuzzleInput (path : string) : int list =
  let
    val strings = readIntoList path;
  in
    List.map (fn x => valOf (Int.fromString x)) strings
end

fun totalFuel (mass : int) : int =
  let
    fun fuel (mass : int) : int option = 
      let 
        val f = mass div 3 - 2;
      in
        if f > 0 then SOME f else NONE
    end
  in
	(case (fuel mass)
	    of SOME f => f + totalFuel f
         | NONE => 0)
end


fun sum (l : int list) : int =
  (case l
    of [] => 0
     | x::xs => x + sum (xs))

(* Main *)
val input = getPuzzleInput "input";
val fuels = List.map totalFuel input;
val solution = sum (fuels);

Assert.eq (solution, 4903759)
