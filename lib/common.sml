fun readIntoList (path : string) : string list =
  let 
    fun intoList (s:TextIO.instream):string list =
      let
        fun trimr (s:string) : string =
          String.substring (s, 0, String.size s - 1);
      in
          (case TextIO.inputLine (s)
            of SOME c => trimr (c) :: intoList s
             | NONE => [])
    end
  in
    intoList (TextIO.openIn path)
end
