import simplifile
import gleam/string
import gleam/list
import gleam/io

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

pub fn complete_task(con: Config) -> Nil {
  let file_contents = get_file(con.filepath)
  case file_contents {
    Ok(val) -> {
      case con.ignore_case {
        True -> {
          let contents = search_case_insensitive(val, con.query)
          io.debug(contents)
        }
        False -> {
          let contents = search(val, con.query)
          io.debug(contents)
        }
      }
      
      Nil
    }
    Error(err) -> {
        io.debug(err)
        Nil
    }
  }
}
