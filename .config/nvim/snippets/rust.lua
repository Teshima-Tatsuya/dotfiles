local ls = require("luasnip")
local s = ls.snippet
local t = ls.text_node
local i = ls.insert_node

-- Rust競プロ用Inputトレイトのスニペット
ls.add_snippets("rust", {
    s("input_trait", {
        t({
            "use std::io;",
            "use std::str::FromStr;",
            "",
            "trait Input: Sized {",
            "    fn input() -> Self;",
            "    fn input_vec() -> Vec<Self>;",
            "    fn input_n(n: usize) -> Vec<Self>;",
            "}",
            "",
            "impl<T> Input for T",
            "where",
            "    T: FromStr,",
            "    T::Err: std::fmt::Debug,",
            "{",
            "    fn input() -> Self {",
            "        let mut s = String::new();",
            "        io::stdin().read_line(&mut s).unwrap();",
            "        s.trim().parse().unwrap()",
            "    }",
            "    ",
            "    fn input_vec() -> Vec<Self> {",
            "        let mut s = String::new();",
            "        io::stdin().read_line(&mut s).unwrap();",
            "        s",
            "            .trim()",
            "            .split_whitespace()",
            "            .map(|x| x.parse().unwrap())",
            "            .collect()",
            "    }",
            "    ",
            "    fn input_n(n: usize) -> Vec<Self> {",
            "        (0..n).map(|_| Self::input()).collect()",
            "    }",
            "}",
            "",
            "fn main() {",
            "    "
        }),
        i(1, "// ここにコードを書く"),
        t({
            "",
            "}"
        })
    }),

    -- 使用例のスニペット
    s("input_example", {
        t({
            "let n: usize = Input::input();",
            "let a: Vec<i32> = Input::input_vec();",
            "let lines: Vec<String> = Input::input_n(n);"
        })
    }),

    -- 単体でInput::input()を挿入
    s("inp", {
        t("let "),
        i(1, "var"),
        t(": "),
        i(2, "i32"),
        t(" = Input::input();")
    }),

    -- 単体でInput::input_vec()を挿入
    s("inpv", {
        t("let "),
        i(1, "vec"),
        t(": Vec<"),
        i(2, "i32"),
        t("> = Input::input_vec();")
    }),

    -- 単体でInput::input_n()を挿入
    s("inpn", {
        t("let "),
        i(1, "vec"),
        t(": Vec<"),
        i(2, "String"),
        t("> = Input::input_n("),
        i(3, "n"),
        t(");")
    }),

    -- よく使う競プロテンプレート
    s("cp_template", {
        t({
            "use std::io;",
            "use std::str::FromStr;",
            "",
            "trait Input: Sized {",
            "    fn input() -> Self;",
            "    fn input_vec() -> Vec<Self>;",
            "    fn input_n(n: usize) -> Vec<Self>;",
            "}",
            "",
            "impl<T> Input for T",
            "where",
            "    T: FromStr,",
            "    T::Err: std::fmt::Debug,",
            "{",
            "    fn input() -> Self {",
            "        let mut s = String::new();",
            "        io::stdin().read_line(&mut s).unwrap();",
            "        s.trim().parse().unwrap()",
            "    }",
            "    ",
            "    fn input_vec() -> Vec<Self> {",
            "        let mut s = String::new();",
            "        io::stdin().read_line(&mut s).unwrap();",
            "        s",
            "            .trim()",
            "            .split_whitespace()",
            "            .map(|x| x.parse().unwrap())",
            "            .collect()",
            "    }",
            "    ",
            "    fn input_n(n: usize) -> Vec<Self> {",
            "        (0..n).map(|_| Self::input()).collect()",
            "    }",
            "}",
            "",
            "fn main() {",
            "    let n: usize = Input::input();",
            "    "
        }),
        i(1, "// メインロジック"),
        t({
            "",
            "}"
        })
    }),
    s("yesno", {
        t({
            "fn yesno(a: bool) {",
            "    if a {",
            "        println!(\"yes\");",
            "    } else {",
            "        println!(\"no\");",
            "    }",
            "}"
        }),
        i(1, "// ここにコードを書く")
    })
})
=======
return {
    s("YN", {
        t("fn yesno(b: bool) {"),
        t({"", "    if b { println!(\"YES\") } else { println!(\"NO\") }"}),
        t({"", "}"}),
    }),
    
    s("yn", {
        t("fn yesno(b: bool) {"),
        t({"", "    if b { println!(\"Yes\") } else { println!(\"No\") }"}),
        t({"", "}"}),
    }),
    
    s("readi", {
        t("fn readi() -> i32 {"),
        t({"", "    let mut line = String::new();"}),
        t({"", "    std::io::stdin().read_line(&mut line).unwrap();"}),
        t({"", "    line.trim().parse().unwrap()"}),
        t({"", "}"}),
    }),
    
    s("reads", {
        t("fn reads() -> String {"),
        t({"", "    let mut line = String::new();"}),
        t({"", "    std::io::stdin().read_line(&mut line).unwrap();"}),
        t({"", "    line.trim().to_string()"}),
        t({"", "}"}),
    }),
    
    s("readi_l", {
        t("fn readi_l() -> Vec<i32> {"),
        t({"", "    let mut line = String::new();"}),
        t({"", "    std::io::stdin().read_line(&mut line).unwrap();"}),
        t({"", "    line.split_whitespace()"}),
        t({"", "        .map(|s| s.parse().unwrap())"}),
        t({"", "        .collect::<Vec<i32>>()"}),
        t({"", "}"}),
    }),
}
>>>>>>> f47ed2d (tmp)
