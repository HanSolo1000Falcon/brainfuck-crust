entry {
    immut args = env::args()
    immut args_len = args:>len()
    if args_len != 1 {
        std::println("expected 1 arg but got {args_len}")
        env::exit(1)
    }

    immut content = std::read_from_file(args:>at(0)):>as_char_array()
    mut memory_size = 1
    mut memory = array::construct(0)
    mut memory_idx = 0
    mut loop_stack = array::construct()
    {
        mut i = 0
        while i < content:>len() {
            immut c = content:>at(i)
            if c == '>' { 
                memory_idx = memory_idx + 1 
                if memory_idx >= memory_size {
                    memory:>push(0)
                    memory_size = memory_size + 1
                }
            }
            else if c == '<' { 
                memory_idx = memory_idx - 1 
                if memory_idx < 0 {
                    memory_idx = memory_size
                }
            }
            else if c == '+' { memory:>set(memory_idx, memory:>at(memory_idx) + 1) }
            else if c == '-' { memory:>set(memory_idx, memory:>at(memory_idx) - 1) }
            else if c == '.' {
                immut as_char = ascii_char(memory:>at(memory_idx))
                std::print("{as_char}")
            }
            else if c == ',' { memory:>set(memory_idx, char_to_ascii(std::getln():>as_char_array():>at(0))) }
            else if c == '[' { loop_stack:>push(i) }
            else if c == ']' {
                if memory:>at(memory_idx) != 0 {
                    i = loop_stack:>at(loop_stack:>len() - 1) - 1
                    loop_stack:>rm(loop_stack:>len() - 1)
                } else {
                    loop_stack:>rm(loop_stack:>len() - 1)
                }
            }
            i = i + 1
        }
    }
}

func ascii_char(n) {
    if n == 32 { ret ' ' }
    else if n == 33 { ret '!' }
    else if n == 34 { ret '"' }
    else if n == 35 { ret '#' }
    else if n == 36 { ret '$' }
    else if n == 37 { ret '%' }
    else if n == 38 { ret '&' }
    else if n == 40 { ret '(' }
    else if n == 41 { ret ')' }
    else if n == 42 { ret '*' }
    else if n == 43 { ret '+' }
    else if n == 44 { ret ',' }
    else if n == 45 { ret '-' }
    else if n == 46 { ret '.' }
    else if n == 47 { ret '/' }
    else if n == 48 { ret '0' }
    else if n == 49 { ret '1' }
    else if n == 50 { ret '2' }
    else if n == 51 { ret '3' }
    else if n == 52 { ret '4' }
    else if n == 53 { ret '5' }
    else if n == 54 { ret '6' }
    else if n == 55 { ret '7' }
    else if n == 56 { ret '8' }
    else if n == 57 { ret '9' }
    else if n == 58 { ret ':' }
    else if n == 59 { ret ';' }
    else if n == 60 { ret '<' }
    else if n == 61 { ret '=' }
    else if n == 62 { ret '>' }
    else if n == 63 { ret '?' }
    else if n == 64 { ret '@' }
    else if n == 65 { ret 'A' }
    else if n == 66 { ret 'B' }
    else if n == 67 { ret 'C' }
    else if n == 68 { ret 'D' }
    else if n == 69 { ret 'E' }
    else if n == 70 { ret 'F' }
    else if n == 71 { ret 'G' }
    else if n == 72 { ret 'H' }
    else if n == 73 { ret 'I' }
    else if n == 74 { ret 'J' }
    else if n == 75 { ret 'K' }
    else if n == 76 { ret 'L' }
    else if n == 77 { ret 'M' }
    else if n == 78 { ret 'N' }
    else if n == 79 { ret 'O' }
    else if n == 80 { ret 'P' }
    else if n == 81 { ret 'Q' }
    else if n == 82 { ret 'R' }
    else if n == 83 { ret 'S' }
    else if n == 84 { ret 'T' }
    else if n == 85 { ret 'U' }
    else if n == 86 { ret 'V' }
    else if n == 87 { ret 'W' }
    else if n == 88 { ret 'X' }
    else if n == 89 { ret 'Y' }
    else if n == 90 { ret 'Z' }
    else if n == 91 { ret '[' }
    else if n == 92 { ret '\' }
    else if n == 93 { ret ']' }
    else if n == 94 { ret '^' }
    else if n == 95 { ret '_' }
    else if n == 96 { ret '`' }
    else if n == 97 { ret 'a' }
    else if n == 98 { ret 'b' }
    else if n == 99 { ret 'c' }
    else if n == 100 { ret 'd' }
    else if n == 101 { ret 'e' }
    else if n == 102 { ret 'f' }
    else if n == 103 { ret 'g' }
    else if n == 104 { ret 'h' }
    else if n == 105 { ret 'i' }
    else if n == 106 { ret 'j' }
    else if n == 107 { ret 'k' }
    else if n == 108 { ret 'l' }
    else if n == 109 { ret 'm' }
    else if n == 110 { ret 'n' }
    else if n == 111 { ret 'o' }
    else if n == 112 { ret 'p' }
    else if n == 113 { ret 'q' }
    else if n == 114 { ret 'r' }
    else if n == 115 { ret 's' }
    else if n == 116 { ret 't' }
    else if n == 117 { ret 'u' }
    else if n == 118 { ret 'v' }
    else if n == 119 { ret 'w' }
    else if n == 120 { ret 'x' }
    else if n == 121 { ret 'y' }
    else if n == 122 { ret 'z' }
    else if n == 123 { ret '{' }
    else if n == 124 { ret '|' }
    else if n == 125 { ret '}' }
    else if n == 126 { ret '~' }
    ret ' '
}

func char_to_ascii(c) {
    if c == ' ' { ret 32 }
    else if c == '!' { ret 33 }
    else if c == '"' { ret 34 }
    else if c == '#' { ret 35 }
    else if c == '$' { ret 36 }
    else if c == '%' { ret 37 }
    else if c == '&' { ret 38 }
    else if c == '(' { ret 40 }
    else if c == ')' { ret 41 }
    else if c == '*' { ret 42 }
    else if c == '+' { ret 43 }
    else if c == ',' { ret 44 }
    else if c == '-' { ret 45 }
    else if c == '.' { ret 46 }
    else if c == '/' { ret 47 }
    else if c == '0' { ret 48 }
    else if c == '1' { ret 49 }
    else if c == '2' { ret 50 }
    else if c == '3' { ret 51 }
    else if c == '4' { ret 52 }
    else if c == '5' { ret 53 }
    else if c == '6' { ret 54 }
    else if c == '7' { ret 55 }
    else if c == '8' { ret 56 }
    else if c == '9' { ret 57 }
    else if c == ':' { ret 58 }
    else if c == ';' { ret 59 }
    else if c == '<' { ret 60 }
    else if c == '=' { ret 61 }
    else if c == '>' { ret 62 }
    else if c == '?' { ret 63 }
    else if c == '@' { ret 64 }
    else if c == 'A' { ret 65 }
    else if c == 'B' { ret 66 }
    else if c == 'C' { ret 67 }
    else if c == 'D' { ret 68 }
    else if c == 'E' { ret 69 }
    else if c == 'F' { ret 70 }
    else if c == 'G' { ret 71 }
    else if c == 'H' { ret 72 }
    else if c == 'I' { ret 73 }
    else if c == 'J' { ret 74 }
    else if c == 'K' { ret 75 }
    else if c == 'L' { ret 76 }
    else if c == 'M' { ret 77 }
    else if c == 'N' { ret 78 }
    else if c == 'O' { ret 79 }
    else if c == 'P' { ret 80 }
    else if c == 'Q' { ret 81 }
    else if c == 'R' { ret 82 }
    else if c == 'S' { ret 83 }
    else if c == 'T' { ret 84 }
    else if c == 'U' { ret 85 }
    else if c == 'V' { ret 86 }
    else if c == 'W' { ret 87 }
    else if c == 'X' { ret 88 }
    else if c == 'Y' { ret 89 }
    else if c == 'Z' { ret 90 }
    else if c == '[' { ret 91 }
    else if c == '\' { ret 92 }
    else if c == ']' { ret 93 }
    else if c == '^' { ret 94 }
    else if c == '_' { ret 95 }
    else if c == '`' { ret 96 }
    else if c == 'a' { ret 97 }
    else if c == 'b' { ret 98 }
    else if c == 'c' { ret 99 }
    else if c == 'd' { ret 100 }
    else if c == 'e' { ret 101 }
    else if c == 'f' { ret 102 }
    else if c == 'g' { ret 103 }
    else if c == 'h' { ret 104 }
    else if c == 'i' { ret 105 }
    else if c == 'j' { ret 106 }
    else if c == 'k' { ret 107 }
    else if c == 'l' { ret 108 }
    else if c == 'm' { ret 109 }
    else if c == 'n' { ret 110 }
    else if c == 'o' { ret 111 }
    else if c == 'p' { ret 112 }
    else if c == 'q' { ret 113 }
    else if c == 'r' { ret 114 }
    else if c == 's' { ret 115 }
    else if c == 't' { ret 116 }
    else if c == 'u' { ret 117 }
    else if c == 'v' { ret 118 }
    else if c == 'w' { ret 119 }
    else if c == 'x' { ret 120 }
    else if c == 'y' { ret 121 }
    else if c == 'z' { ret 122 }
    else if c == '{' { ret 123 }
    else if c == '|' { ret 124 }
    else if c == '}' { ret 125 }
    else if c == '~' { ret 126 }
    ret 32
}