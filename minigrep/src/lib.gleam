import simplifile
import gleam/string
import gleam/list

pub opaque type Config {
  Config(filepath: String, query: String, ignore_case: Bool)
}

pub fn build_config(
  filepath: String,
  query: String,
  ignore_case: Bool,
) -> Result(Config, String) {
  Ok(Config(filepath, query, ignore_case))
}

pub fn get_file(filepath: String) -> Result(String, simplifile.FileError) {
  simplifile.read(filepath)
}

pub fn search(contents: String, query: String) -> List(String) {
  contents
  |> string.split(on: "\n")
  |> list.filter(fn(line) { string.contains(line, query) })
}

pub fn search_case_insensitive(contents: String, query: String) -> List(String) {
  let query = string.lowercase(query)
  contents
  |> string.split(on: "\n")
  |> list.filter(fn(line) {
    line
    |> string.lowercase()
    |> string.contains(query)
  })
}
// pub fn search() -> Nil {
//     todo
// }
