import gleam/io
import simplifile

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

pub fn filterquery() -> Nil {
    todo
}