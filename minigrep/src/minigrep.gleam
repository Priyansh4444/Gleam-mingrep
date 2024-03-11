import gleam/io
import argv
import lib

pub fn main() {
  io.println("Hello from minigrep!")
  case argv.load().arguments {
    [_] -> io.println("Not enough arguements!")
    [x, y] -> io.println("There are two flags!")
    [x, y, z] -> io.println("Just enough flags :D")
    [x, y, z, _] -> io.println("There are two or more flags!")
    _ -> io.println("Please enter a file name")
  }
}
