package com.jonassjodin.cssc

import kotlin.system.exitProcess

fun errorExit() {
    System.err.println("Usage: (cssc 223344) for HEX or (cssc 230 45 230) for RGB")
    exitProcess(1)
}

fun getColors(args: Array<String>): Pair<Boolean, List<Int>> {
    val hexRegex = Regex("^#?([0-9a-fA-F]{3}|[0-9a-fA-F]{4}|[0-9a-fA-F]{6}|[0-9a-fA-F]{8})$")
    val rgbRegex = Regex("^rgb\\(.*\\)$")
    val rgbaRegex = Regex("^rgba\\(.*\\)$")

    val li = when (args.size) {
        1 -> when {
            hexRegex.matches(args[0]) -> Pair(true, Hex.parse(args[0]))
            rgbRegex.matches(args[0]) -> Pair(false, RGB.parseRGB(args[0]))
            rgbaRegex.matches(args[0]) -> Pair(false, RGB.parseRGBA(args[0]))
            else -> throw IllegalArgumentException("Invalid argument")
        }
        3, 4 -> Pair(false, RGB.parseArray(args))
        else -> throw IllegalArgumentException("Invalid argument")
    }
    if (li.second.size !in 3..4) throw IllegalArgumentException("Only 3 or 4 color arguments are allowed")
    return li
}

fun getPrintable(printAsRGB: Boolean, colors: List<Int>): String {
    return when (printAsRGB) {
        true -> when (colors.size) {
            3 -> RGB.formatAsRGB(colors)
            4 -> RGB.formatAsRGBA(colors)
            else -> ""
        }
        false -> Hex.format(colors)
    }
}

fun main(args: Array<String>) {
    if (args.isEmpty()) errorExit()
    val (printAsRGB, colors) = getColors(args)
    print(getPrintable(printAsRGB, colors))
}
