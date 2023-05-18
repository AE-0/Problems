import kotlin.io.path.Path
import kotlin.io.path.readLines
import kotlin.math.abs

fun main() {
    val filename = Path("src", "input.txt").readLines()
    val size = filename.first().length
    val epsilon: String; var gamma = ""; var temp = ""

    //Part 1

    for (i in 0 until size) {
        for (line in filename) {
            temp += line[i].toString()
        }
        gamma += if( temp.count { it.digitToInt() > 0 } > temp.length / 2 ) 1
        else 0
        temp = ""
    }
    epsilon = gamma.map { abs(n = it.digitToInt() - 1 ) }.joinToString(separator = "")
    println(gamma.toInt(2) * epsilon.toInt(2))
}
