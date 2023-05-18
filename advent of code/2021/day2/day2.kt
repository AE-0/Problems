import kotlin.io.path.Path
import kotlin.io.path.readLines

fun main() {
    val filename = Path("src", "input.txt").readLines()
    var x:Int = 0; var y:Int = 0

    // Part 1
    for (i in filename) {
        if (i.contains("forward") ) x += i.last().digitToInt()
        if (i.contains("up") ) y -= i.last().digitToInt()
        if (i.contains("down") ) y += i.last().digitToInt()
    }
    println(x * y)

    // Part 2
    var aim:Int = 0; x = 0; y = 0;

    for (i in filename) {
        if (i.contains("forward") ) {
            x += i.last().digitToInt()
            if (aim > 1) y += i.last().digitToInt() * aim
        }
        if (i.contains("up") ) aim -= i.last().digitToInt()
        if (i.contains("down") ) aim += i.last().digitToInt()
    }
    println(x * y)
}
