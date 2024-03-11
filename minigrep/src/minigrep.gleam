import gleam/io
import argv
import lib
import gleam/result

pub fn main() {
  io.println("Hello from minigrep!")
  let x = case argv.load().arguments {
    [_] -> Error("Not enough arguements!")
    [x, y] -> lib.build_config(x, y, False)
    [x, y, z] ->
      lib.build_config(x, y, case z {
        "True" -> True
        "False" -> False
        _ -> False
      })
    [x, y, z, _] ->
      lib.build_config(x, y, case z {
        "True" -> True
        "False" -> False
        _ -> False
      })
    _ -> Error("Please enter a file name")
  }
 io.debug(case x{
  Ok(val) -> {
    lib.complete_task(val)
  }
  Error(err) -> Nil
 })
}
