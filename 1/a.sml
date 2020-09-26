use "../lib/common.sml"; (* readIntoList *)
use "../lib/assert.sml"; (* Assert.* *)

fun getPuzzleInput (path : string) : int list =
  let
    val strings = readIntoList path;
  in
    List.map (fn x => valOf (Int.fromString x)) strings
end

fun fuel (mass : int) : int = mass div 3 - 2;

fun sum (l : int list) : int =
  (case l
    of [] => 0
     | x::xs => x + sum (xs))

(* Main *)
val input = getPuzzleInput "input";
val fuels = List.map fuel input;
val solution = sum (fuels);

Assert.eq (solution, 3271095);
