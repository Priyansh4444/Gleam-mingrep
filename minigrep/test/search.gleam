import gleeunit/should
import lib

pub fn search_case_sensitive_test() {
  let poem =
    "This is a poem to my dearest,
the fiercest and cruel,

my brain who cant but drool,
at the thought being a fool."

  should.equal(
    lib.search(poem, "This"),
    [
      "This is a poem to my dearest,"
    ],
  )
}

pub fn search_case_insensitive_test() {
  let poem =
    "This is a poem to my dearest,
the fiercest and cruel,

my brain who cant but drool,
at the thought being a fool."

  should.equal(
    lib.search_case_insensitive(poem, "the"),
    [
      "the fiercest and cruel,",
      "at the thought being a fool.",
    ],
  )
}